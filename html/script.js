const input = document.querySelector('.changed');
window.addEventListener('message', event => {
  var data = event.data;
  if (data.type === 'open') {
    document.body.style.visibility = 'visible';
  } else if (data.type === 'close') {
    document.body.style.visibility = 'hidden';
  }
});

const changeName = () => {
  console.log(`Beírt név: ${input.value}`);
  $.post(
    'http://wx_fakename/adat',
    JSON.stringify({
      name: input.value,
    })
  );
};

window.onkeyup = function (data) {
  if (event.key == 'Backspace') {
    $.get('http://wx_fakename/closePanel');
  }
};
