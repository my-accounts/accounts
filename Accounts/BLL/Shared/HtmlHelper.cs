using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Accounts.BLL;

namespace Accounts
{
    public static partial class HtmlHelperExtensions
    {
        // Uses to dynamically create styled tri-state checkboxes for Accounts and Years expandable boxes
        public static HtmlString Chechboxes(this HtmlHelper htmlHelper, string id, IEnumerable<IFieldsetItem> items)
        {
            var yearsBuilder = new StringBuilder("<div>");
            foreach (var item in items)
            {
                yearsBuilder.AppendFormat("<div><input type='checkbox' name='{0}{1}' id='{0}{1}'><label for='{0}{1}'>{2}</label></div>", id, item.Id, item.Name);
            }
            yearsBuilder.Append("</div>");

            return new HtmlString(yearsBuilder.ToString());
        }

        // Uses to create dynamically styled tri-state checkboxes within types expander ONLY
        public static HtmlString SubtypesCheckboxes(this HtmlHelper htmlHelper, IEnumerable<IFieldsetMultilevelItem> items)
        {
            var builder = new StringBuilder();

            foreach (var type in StaticData.RecordTypes)
            {
                IEnumerable<IFieldsetMultilevelItem> fieldsetMultilevelItems = items.Where(i => i.ParentId == type.TypeId);

                HtmlString html = Chechboxes(htmlHelper, "_subtype", fieldsetMultilevelItems.Select(fieldsetMultilevelItem => fieldsetMultilevelItem as IFieldsetItem));

                builder.AppendFormat(
                    @"<div><input type='checkbox' name='_type{0}' id='_type{0}'><label for='_type{0}'>{1}</label><span class='tr typeExpander hand cls l5 d4'></span>{2}</div>",
                    type.TypeId, type, html);
            }

            return new HtmlString(builder.ToString());
        }

        
        // Flat select box. As an example, it is used in UploadPage in History Uploads for companies list
        public static HtmlString SelectBox(this HtmlHelper htmlHelper, string id, IEnumerable<IFieldsetItem> items)
        {
            return SelectBox(htmlHelper, id, items, -1);
        }
        public static HtmlString SelectBox(this HtmlHelper htmlHelper, string id, IEnumerable<IFieldsetItem> items, int selectedId)
        {
            var builder = new StringBuilder("<select id='" + id + "' name='" + id + "' data-old='" + selectedId + "'>");

            foreach (var item in items)
            {
                string selected = item.Id == selectedId ? "selected" : string.Empty;
                builder.AppendFormat("<option value='{0}' {1}>{2}</option>", item.Id, selected, item.Name);
            }
            builder.Append("</select>");

            return new HtmlString(builder.ToString());
        }


        // Used for nice drop-downs - both within table and on modal windows
        public static HtmlString OptgroupSelect(this HtmlHelper htmlHelper, IEnumerable<IFieldsetMultilevelItem> items)
        {
            return OptgroupSelect(htmlHelper, items, -1);
        }
        public static HtmlString OptgroupSelect(this HtmlHelper htmlHelper, IEnumerable<IFieldsetMultilevelItem> items, int selectedId)
        {
            var builder = new StringBuilder("<select data-old='" + selectedId + "' class='subtypes'>");

            foreach (var type in StaticData.RecordTypes)
            {
                IEnumerable<IFieldsetMultilevelItem> fieldsetMultilevelItems = items.Where(i => i.ParentId == type.TypeId);

                // Do this check to prevent showing empty top-level menus having children at all
                if (fieldsetMultilevelItems.Any())
                {
                    builder.Append("<optgroup label='" + type.Name + "'>");

                    foreach (IFieldsetMultilevelItem subtype in fieldsetMultilevelItems)
                    {
                        string selected = subtype.Id == selectedId ? "selected" : string.Empty;
                        builder.AppendFormat("<option value='{0}' {2}>{1}</option>", subtype.Id, subtype.Name, selected);
                    }

                    builder.Append("</optgroup>");
                }
            }
            builder.Append("</select>");

            return new HtmlString(builder.ToString());
        }

        public static HtmlString SubtypeSelectOptions(this HtmlHelper htmlHelper)
        {
            var builder = new StringBuilder();

            foreach (var type in StaticData.RecordTypes)
            {
                builder.Append("<optgroup label='" + type.Name + "'>");

                IEnumerable<IFieldsetMultilevelItem> fieldsetMultilevelItems = StaticData.RecordSubtypes.Where(i => i.ParentId == type.TypeId);
                foreach (IFieldsetMultilevelItem subtype in fieldsetMultilevelItems)
                {
                    builder.AppendFormat("<option value='s{0}'>{1}</option>", subtype.Id, subtype.Name);
                }
                builder.Append("</optgroup>");
            }

            return new HtmlString(builder.ToString());
        }

        public static List<int> Compress(string uncompressed)
        {
            // build the dictionary
            Dictionary<string, int> dictionary = new Dictionary<string, int>();
            for (int i = 0; i < 256; i++)
                dictionary.Add(((char)i).ToString(), i);

            string w = string.Empty;
            List<int> compressed = new List<int>();

            foreach (char c in uncompressed)
            {
                string wc = w + c;
                if (dictionary.ContainsKey(wc))
                {
                    w = wc;
                }
                else
                {
                    // write w to output
                    compressed.Add(dictionary[w]);
                    // wc is a new sequence; add it to the dictionary
                    dictionary.Add(wc, dictionary.Count);
                    w = c.ToString();
                }
            }

            // write remaining output if necessary
            if (!string.IsNullOrEmpty(w))
                compressed.Add(dictionary[w]);

            return compressed;
        }
        public static string Decompress(List<int> compressed)
        {
            // build the dictionary
            Dictionary<int, string> dictionary = new Dictionary<int, string>();
            for (int i = 0; i < 256; i++)
                dictionary.Add(i, ((char)i).ToString());

            string w = dictionary[compressed[0]];
            compressed.RemoveAt(0);
            StringBuilder decompressed = new StringBuilder(w);

            foreach (int k in compressed)
            {
                string entry = null;
                if (dictionary.ContainsKey(k))
                    entry = dictionary[k];
                else if (k == dictionary.Count)
                    entry = w + w[0];

                decompressed.Append(entry);

                // new sequence; add it to the dictionary
                dictionary.Add(dictionary.Count, w + entry[0]);

                w = entry;
            }

            return decompressed.ToString();
        }
    }
}
