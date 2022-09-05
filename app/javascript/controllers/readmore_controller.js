var cards = document.querySelectorAll('.card-giva');

[...cards].forEach((card)=>{
  card.addEventListener( 'click', function() {
    card.classList.toggle('is-flipped');
  });
});
