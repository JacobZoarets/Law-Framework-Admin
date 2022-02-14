
$(document).ready(function () {

    // send click event to page

    var check = function () {
        var iframe = document.querySelector('[name=bsFrame]');
        if (iframe !== null && iframe.contentWindow !== null) {
            // run when condition is met

            click(261, 317);
            click(478, 320);
        }
        else {
            setTimeout(check, 5000); // check again in a second
        }
    };

    function click(x,y) {
        //(261, 317)
        //var x = 261;
       // var y = 317;
        console.log("click: x:" + x + " y:" + y);
        var ev = document.createEvent("MouseEvent");
        var el = document.elementFromPoint(x, y);
        ev.initMouseEvent(
            "click",
            true /* bubble */, true /* cancelable */,
            window, null,
            x, y, 0, 0, /* coordinates */
            false, false, false, false, /* modifier keys */
            0 /*left*/, null
        );
        el.dispatchEvent(ev);
    }

    check();
//    setTimeout(click, 10000);
});