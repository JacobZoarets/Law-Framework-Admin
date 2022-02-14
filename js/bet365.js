


function makeAlert() {
    alert('im in');
}


//makeAlert();
$(document).ready(function () {
    // Handler for .ready() called.

    $(document).on("mousemove", function (event) {
        // $("#log").text("pageX: " + event.pageX + ", pageY: " + event.pageY);
        //console.log("pageX: " + event.pageX + ", pageY: " + event.pageY);
    });

    $(document).on("mouseup", function (event) {       
        console.log("clicked pageX: " + event.pageX + ", pageY: " + event.pageY);   
    });

    $(document).on("onkeyup", function (event) {
        console.log("onkeypress pageX: " );
    });

    $(document).keydown(function (event) {
        var keycode = (event.keyCode ? event.keyCode : event.which);
        console.log("onkeypress keycode: " + keycode);
    });

    
    

    var check = function () {
        var iframe = document.querySelector('[name=bsFrame]');
        if (iframe !== null && iframe.contentWindow !== null) {
            // run when condition is met

            console.log("iframe found");
           
            iframe.contentWindow.foo = function () {
                console.log("executing foo inside an iframe!");


                $(iframe.contentWindow.document).keyup(function (event) {
                    var text = event.target.value;
                    /*var id = iframe.contentWindow.document.getElementsByClassName("bs-Stake_TextBox");
                    for (i = 0; i < id.length; i++) {
                        text += id[i].value;
                    }*/
                    console.log("all texts: " + text + " eventPagex:" + event.pageX );
                });

                
            };

            iframe.contentWindow.trace_mouse = function () {
                console.log("executing trace_mouse inside an iframe!");

                $(iframe.contentWindow.document).on("mousemove", function (event) {
                    // $("#log").text("pageX: " + event.pageX + ", pageY: " + event.pageY);
                    //console.log("pageX: " + event.pageX + ", pageY: " + event.pageY);
                });
            };

            iframe.contentWindow.mouseup = function () {
                console.log("executing mouseup inside an iframe!");

                $(iframe.contentWindow.document).on("mouseup", function (event) {
                    console.log("clicked pageX: " + event.pageX + ", pageY: " + event.pageY);
                });
            };

           

            iframe.contentWindow.eval(iframe.contentWindow.foo());
            iframe.contentWindow.eval(iframe.contentWindow.trace_mouse());
            iframe.contentWindow.eval(iframe.contentWindow.mouseup());
        }
        else {
            setTimeout(check, 1000); // check again in a second
        }
    };

    check();

    /*$(document).keypress(function (event) {
        console.log("keypress pageX: ");
    });*/
});

