Post -> /users/login
{
    "email":"email@example.com",
    "password":"passwd123"
}

Post -> /users/register
{
    "email":"email@example.com",
    "password":"passwd123",
    "username":"mohamed"
}

* email só pode ser cadastrado uma vez
* senha guardada com SHA
* token de acesso