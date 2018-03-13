import flatpickr from 'flatpickr'

const showPickerForm = function() {
  const showDateField = document.getElementById("show_date");
  showDateField.flatpickr();
};

export {showPickerForm}
