/**
 * 
 */
 
 console.clear();

// animation on scroll
AOS.init({
    //once:true,
    duration:800,
    easing: 'ease',
});


// 3차 visual stroy slick 적용
$('.v-story-slider').slick({
    dots:true,
    draggable:false,
    arrows:true,
    adaptiveHeight:true,
    centerMode:true,
    centerPadding:'300px',
    responsive: [
        {
          breakpoint: 1440,
          settings: {
            centerPadding:'20vw',
          }
        },
        {
          breakpoint: 770,
          settings: {
            centerPadding:'0',
            arrows:false,
          }
        },
    ],
}).on('beforeChange', function(event, slick, currentSlide, nextSlide) {
    /* 자바스크립트
    if (currentSlide !== nextSlide) {
        document.querySelectorAll('.slick-center + .slick-cloned').forEach((next) => {
            // timeout required or Slick will overwrite the classes
            setTimeout(() => next.classList.add('slick-current', 'slick-center'));
        });
    }
    */
    // IE 호환성을 고려한 제이쿼리
    if (currentSlide !== nextSlide) {
        $('.slick-center + .slick-cloned').each(function(index, node) {
            var $node = $(node);
            
            setTimeout(function() {
                $node.addClass('slick-current');
                $node.addClass('slick-center');
            });
        });
    }
}); 