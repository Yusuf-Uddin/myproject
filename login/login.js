function handleLogin(type) {
    var type = type;

    // Handle Login/Register
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
    mta.triggerEvent('onLogin', type, username, password);
}