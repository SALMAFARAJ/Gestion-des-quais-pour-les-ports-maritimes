const FORM = $("form"); // set form or other element here
const TYPES = ["input[type=text], input[type=submit],input[type=date],input[type=password],input[type=email]"]; // set which elements get targeted by the focus
const FOCUS = $("#focus"); // focus element

// function for positioning the div
function position(e) {
  // get position
  var props = {
    top: e.offset().top,
    left: e.offset().left,
    width: e.outerWidth(),
    height: e.outerHeight(),
    radius: parseInt(e.css("border-radius"))
  };
  
  // set position
  FOCUS.css({
    top: props.top,
    left: props.left,
    width: props.width,
    height: props.height,
    "border-radius": props.radius
  });
  
  FOCUS.fadeIn(200);
}

FORM.find(TYPES.join()).each(function(i) {
  // when clicking an input defined in TYPES
  $(this).focus(function() {
    el = $(this);

    // adapt size/position when resizing browser
    $(window).resize(function() {
      position(el);
    });

    position(el);
  });
});

FORM.on("focusout", function(e) {
  setTimeout(function() {
    if (!e.delegateTarget.contains(document.activeElement)) {
      FOCUS.fadeOut(200);
    }
  }, 0);
});