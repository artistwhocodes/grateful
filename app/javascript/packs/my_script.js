// $(document).on(function() {
document.addEventListener("turbolinks:load",function() {

  function annoying(){
    $('.nav-link.active').removeClass('active');
    $('a[href="' + location.pathname + '"]').closest('.nav-item.nav-link').addClass('active');
  }
  annoying();

  function carouseleffect(){
    $('.carousel').carousel({
      interval: 2000
    })
  }
  carouseleffect();

  function popover(){
    $('[data-toggle="popover"]').popover({
     html : true,
     content: function () {
        return $(this).data('content');
      }
    });
  }
  popover();

  var $wtf =  localStorage.getItem('test');

  function quicktitleform(){
  //https://jsfiddle.net/no7ukqp9/2/
  // get the text
  var text = $('#miniGratefulForm').val();
  // set the item in localStorage
  localStorage.setItem('test', text);

  // bind text to 'blur' event for div
  $('#miniGratefulForm_button').click('blur', function(){

  	// check the new text
    var newText = $('#miniGratefulForm').val();
  	// overwrite the old text
    localStorage.setItem('test', newText);

  	// test if it works

    window.location = "/posts/new";
    })
  }
  quicktitleform();

  function titledata(){
    $('#flowers').val($wtf);
  }
  titledata();





});
