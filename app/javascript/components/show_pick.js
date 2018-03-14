import flatpickr from 'flatpickr';

function enableTheaters(date)
{
  // function apiService(data) {
  //   fetch(`${id}/filter_shows`, {
  //     method: 'POST',
  //     body: data,
  //     headers: {
  //       'Accept': 'application/json',
  //       'X-Requested-With': 'XMLHttpRequest',
  //       'X-CSRF-Token': token
  //     },
  //     credentials: 'same-origin'
  //   }).then( response => response.json() )
  //   .then((json) => {
  //     debugger;
  //     return json;
  //   });theaterSelect
  // }
  // console.log(date);


  const theaterSelect = document.getElementById('show_theater');
  const theaterSelectLength = theaterSelect.options.length;
  for (let i=1; i<theaterSelectLength; i++ ){
    theaterSelect.options[i] = null;
  }

  const id = window.location.href.split('/')[4];
  const dateForm = new FormData();
  const token = document.querySelector('meta[name=csrf-token]').content;

  dateForm.append('date', date);

  fetch(`${id}/filter_shows`, {
    method: 'POST',
    body: dateForm,
    headers: {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'X-CSRF-Token': token
    },
    credentials: 'same-origin'
  }).then( response => response.json() )
  .then((json) => {
    // debugger;
    // return json;
    const theaters = json.theaters;

    for(var i = 0; i < theaters.length; i++) {
      var opt = theaters[i];
      var el = document.createElement("option");
      el.textContent = opt.name;
      el.value = opt.id;
      theaterSelect.appendChild(el);
    }

    theaterSelect.disabled = false;

  });


  // debugger

  // $.ajax({
  //   url: `/movies/${id}/filter_shows`,
  //   type: "POST",
  //   processData: false,
  //   data: data,
  //   headers: {
  //     'Accept': 'application/json',
  //     'X-Requested-With': 'XMLHttpRequest',
  //     'X-CSRF-Token': token
  //   },
  //   success: function(xqhr){
  //     debugger
  //     console.log("Hey");
  //   }
  // });
}

const showPickerForm = function() {
  const showDateField = document.getElementById("show_date");
  if (showDateField) {
    const dates = JSON.parse(showDateField.dataset.dates);
    showDateField.flatpickr({
      enable: dates,
      onChange: enableTheaters
    });
  }
};

export {showPickerForm}
