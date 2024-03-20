let moneyFormat = Intl.NumberFormat('es-ES');
window.addEventListener('message', function(event) {
    var v = event.data;

    switch(v.action) {
        case 'UpdateData':
            UpdateData(v.key, v.value, v.key2, v.value2);
            break;
    }
});

function UpdateData(key, value, key2, value2) {
    if (key2 == 'grado') {
        $(`.${key}`).text(value);
        $(`.${key2}`).text(value2);
    } else {
        $(`.${key}`).text(moneyFormat.format(value));
    }
}
