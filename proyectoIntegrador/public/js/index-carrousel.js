
  $(document).ready(function(){
    $('.carousel').carousel({
      duration: 1000,
      shift: 50,
    });

    // Botones
    // $('.prev').click(function(){
    //   $('.carousel').carousel('prev')
    // })
    // $('.next').click(function(){
    //   $('.carousel').carousel('next')
    // })

  });

  // CON JAVASCRIPT (no funciona)
  // document.addEventListener('DOMContentLoaded', function() {
  //   var elems = document.querySelectorAll('.carousel');
  //   var instances = M.Carousel.init(elems, options);
  // });