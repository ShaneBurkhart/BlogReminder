var Blogger = Blogger || {};

Blogger.home = {
  index: function(){
    $(".try-it").click(function(){
      $(".notification").slideDown(200).delay(3000).slideUp(200);
    });

    $(".reserve").click(function(event){
      event.preventDefault();
      //calculate destination place
      var dest=0;
      if($(this.hash).offset().top > $(document).height() - $(window).height()){
          dest = $(document).height() - $(window).height();
      }else{
          dest = $(this.hash).offset().top;
      }
      //go to destination
      $('html,body').animate({scrollTop:dest}, 500, 'swing');
    });
  }
}
