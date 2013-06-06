// Create an object with controller actions to be passed into the AJAX requests to the server. Helps with untellisense in VS
var ControllerActions = new Actions(rootPath);
var StaticData = new Static();

function Actions(root) {

    this.Home = [];
        this.Home.Csv = root + "Home/Csv";
        this.Home.RefreshData = root + "Home/RefreshData";
        this.Home.UpdateRecord = root + "Home/UpdateRecord";
        this.Home.AttachmentAdd = root + "Home/AttachmentAdd";
        this.Home.AttachmentDel = root + "Home/AttachmentDel";
        this.Home.NewRegexForRecord = root + "Home/NewRegexForRecord";

    this.Upload = [];
        this.Upload.DragDropUpload = root + "Upload/DragDropUpload";
        this.Upload.UploadChangeCompany = root + "Upload/UploadChangeCompany";
        this.Upload.UploadFileDelete = root + "Upload/UploadFileDelete";
        this.Upload.UploadItems = root + "Upload/UploadItems";

    this.Settings = [];

        this.Settings.YearStartDateChange = root + "Settings/YearStartDateChange";
    
        this.Settings.CompanyAdd = root + "Settings/CompanyAdd";
        this.Settings.CompanyRename = root + "Settings/CompanyRename";
        this.Settings.CompanyDel = root + "Settings/CompanyDel";
    
        this.Settings.TypeAdd = root + "Settings/TypeAdd";
        this.Settings.TypeRename = root + "Settings/TypeRename";
        this.Settings.TypeDelete = root + "Settings/TypeDelete";

        this.Settings.SubtypeAdd = root + "Settings/SubtypeAdd";
        this.Settings.SubtypeDelete = root + "Settings/SubtypeDelete";
        this.Settings.SubtypeUpdate = root + "Settings/SubtypeUpdate";
    
        this.Settings.RegexAdd = root + "Settings/RegexAdd";
        this.Settings.RegexRename = root + "Settings/RegexRename";
        this.Settings.RegexDelete = root + "Settings/RegexDelete";
}

function Static() {
    this.Errors = [];
    this.Errors.InvalidFilter = "Invalid filter - doesn't match any item";
    this.Errors.DeletingUploadFault = "Error while deleting upload file";
}

// This event handler should execute for every page
$(document).ready(function () {
    
    // Popup with overlay for user cabinet
    setPopupHandlers();
    
    // Adjust size if browser changed size
    $(window).resize(function () {
        adjustSize();
    });
    
    adjustSize();
});

function adjustSize() {

    var leftHeight = $('#right').height() > $(document).height() ? $('#right').height() : '100%';
    var lh = $('#left').height() > leftHeight ? $('#left').height() : leftHeight;

    //var leftHeight = $('#right').height() > $('#left').height() ? $('#right').height() : $('#left').height(); //1 $(document).height()  ? $('#right').height() : '100%';
    //var lh = leftHeight > $(document).height() ? leftHeight : /*$(document).height();*/ '100%';

    $('#left').css('height', lh);
    $('#content').css('height', $('#main').height() - 60);
}
