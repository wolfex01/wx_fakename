const input = document.querySelector('.changed');

// eseménykezelő a message eseményhez
window.addEventListener('message', (event) => {
  const data = event.data;
  const body = document.body.style;

  if (data.type === 'open') {
    body.visibility = 'visible';
  } else if (data.type === 'close') {
    body.visibility = 'hidden';
  }
});

// a név változását kezelő funkció
const changeName = () => {
  const name = input.value.trim();

  if (name.length > 0) {
    console.log(`Beírt név: ${name}`);

    // AJAX kérés a szerver felé
    fetch('http://wx_fakename/adat', {
      method: 'POST',
      body: JSON.stringify({ name }),
      headers: {
        'Content-Type': 'application/json'
      }
    });
  }
};

// eseménykezelő a billentyűzet gombnyomásokhoz
window.onkeyup = function (event) {
  if (event.key === 'Backspace') {
    fetch('http://wx_fakename/closePanel');
  }
};
