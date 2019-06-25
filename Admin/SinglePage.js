///////////////////////////////////////////////
//Update inner content
///////////////////////////////////////////////
function UpdateInnerContent(content)
{

    $("#innerContentDiv").html(content);
    AttachSinglePageBehaviour();


}

function AttachSinglePageBehaviour() {

    //catch all inner links in the inner content
    var $allLinks = $("#innerContentDiv").find("a[href^='http://localhost:2099/'], a[href^='//localhost:2099/'], a[href^='localhost:2099/'], a[href^='/'], a[href^='./'], a[href^='../'], a[href^='#']").not(function () {
        return $(this).attr('href').match(/\.(pdf|mp3|jpg|jpeg|etc)$/i);
    });
    //catch all forms in the inner content
    var $forms = $("#innerContentDiv").find("form");
    //UpdateAnckorToUseAjax
    UpdateAnckorToUseAjax($allLinks);
    makeFormsUsesAjaxPost($forms);
}

///////////////////////////////////////////////
//LoadUrlinAjaxMode
///////////////////////////////////////////////
function LoadUrlinAjaxMode(url) {
    //loading ....
    $("#innerContentDiv").html('<div class="ibox-content" style=""><div class="spiner-example"><div class="sk-spinner sk-spinner-wave"><div class="sk-rect1"></div><div class="sk-rect2"></div><div class="sk-rect3"></div><div class="sk-rect4"></div><div class="sk-rect5"></div></div></div></div>');
    //get the new content
    $("#innerContentDiv").load(url, AttachSinglePageBehaviour);

}
///////////////////////////////////////////////



///////////////////////////////////////////////
//UpdateAnckorToUseAjax
///////////////////////////////////////////////
function UpdateAnckorToUseAjax($anchor) {
    $anchor.unbind("click");
    $anchor.click(function (e) {
        e.preventDefault();
        var url = $(this).attr("href");
        LoadUrlinAjaxMode(url);
        return false;
    });
}
///////////////////////////////////////////////


/*////////////////////////////////////////////////////////////////////*/
//Override form submit
function makeFormsUsesAjaxPost($forms) {
    //----------------------------------------------------


    $forms.removeAttr("onsubmit");

    $forms.submit(function (event) {
        alert("teeet");
        debugger;
        event.preventDefault();
        WebForm_OnSubmit();

        var form = $(this);
        $.ajax({
            url: form.attr('action'), // Get the action URL to send AJAX to
            type: "POST",
            data: form.serialize(), // get all form variables
            success: function (result) {
                // ... do your AJAX post result
                console.log(result);
                UpdateInnerContent(result);
            }
        });
        return false;
    });
    //----------------------------------------------------
}

/*////////////////////////////////////////////////////////////////////*/

$(document).ready(function () {


    debugger;
    //var $mainLinks = $(".SlideIconContainer").find("a");
   // setTimeout(function () {
        alert("ready now");
        //UpdateAnckorToUseAjax($mainLinks);
        var $internalLinks = $("a[href^='http://localhost:2099/'], a[href^='//localhost:2099/'], a[href^='localhost:2099/'], a[href^='/'], a[href^='./'], a[href^='../']");

        $internalLinks = $internalLinks.not(function () {
            return $(this).attr('href').match(/\.(pdf|mp3|jpg|jpeg|etc)$/i);
        });

        UpdateAnckorToUseAjax($internalLinks);

        //if (hasRedirecturl) {
        //    LoadUrlinAjaxMode(redirectUrl, fu);
        //}

    //}, 5000);





});

