function handleLogin(type) {
    if (type === "Login") {
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;
        mta.triggerEvent('onLogin', username, password);
    }
}