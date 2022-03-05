# assignment

A new Flutter project.

## Bilgiler

- Kullanıcı mail: cengdeneme@gmail.com
Şifre: 123456
Token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MjFmOWMxOWIwN2QxZTEzOWFmNWI0ZDAiLCJuYmYiOjE2NDY0NDQ1NjksImV4cCI6MTY0OTAzNjU2OSwiaXNzIjoiaSIsImF1ZCI6ImEifQ.f0AfBwpSEh3pGbUQNCrgH65sxvSQLcXUCiDtPPfl7xg

- Kullanıcı mail: cengtest@gmail.com
Şifre: 123456
Token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MjFmOWMxOWIwN2QxZTEzOWFmNWI0ZDAiLCJuYmYiOjE2NDY0MjAxNDYsImV4cCI6MTY0OTAxMjE0NiwiaXNzIjoiaSIsImF1ZCI6ImEifQ.ltlmJ6Mpqr2vhwYxWKubjWA_NUWujGjfpNZne_a3bmo

- Kullanıcı maili: cengtest1@gmail.com
- Token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MjIyNjFlM2IwN2QxZTEzOWFmNWI1MDIiLCJuYmYiOjE2NDY0MjA0NTEsImV4cCI6MTY0OTAxMjQ1MSwiaXNzIjoiaSIsImF1ZCI6ImEifQ.eM6nXtuz3WBYL3WhACECQOZoo6xY6JyEcV6udgUSsIM

## API cevapları

### /General/UploadImage POST

Başarılı istek:

{
  "ValidationErrors": [],
  "HasError": false,
  "Message": "Yükleme başarılı.",
  "Data": "https://blinck.s3.eu-central-1.amazonaws.com/uploads/profilePhoto/f1443978-b048-43ad-b726-ca8f10817210.png"
}

### /Account/Get GET

{
  "ValidationErrors": [],
  "HasError": false,
  "Message": null,
  "Data": {
    "Id": "621f99d8b07d1e139af5b4cf",
    "Email": "cengdeneme@gmail.com",
    "Image": "https://blinck.s3.eu-central-1.amazonaws.com/uploads/profilePhoto/f1443978-b048-43ad-b726-ca8f10817210.png",
    "Location": {
      "Longtitude": "27.6669987",
      "Latitude": "85.3071003"
    },
    "FavoriteBlogIds": []
  }
}

### /LogIn/SignIn POST

- doğru mail şifre:
{
  "ValidationErrors": [],
  "HasError": false,
  "Message": null,
  "Data": {
    "Token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MjFmOTlkOGIwN2QxZTEzOWFmNWI0Y2YiLCJuYmYiOjE2NDY0MTY2ODksImV4cCI6MTY0OTAwODY4OSwiaXNzIjoiaSIsImF1ZCI6ImEifQ.xnNT9svN-pGAp3JBrnO3YddYVv-bP4UCq3qJEqKQLQs"
  }
}

- yanlış şifre, mail
{
  "ValidationErrors": [],
  "HasError": true,
  "Message": "Hatalı email veya parola girdiniz.",
  "Data": null
}

- boş mail, şifre
{
  "ValidationErrors": [
    {
      "Key": "Email",
      "Value": "Geçersiz e-posta adresi girdiniz."
    },
    {
      "Key": "Password",
      "Value": "Lütfen bu alanı doldurun."
    }
  ],
  "HasError": true,
  "Message": "Lütfen hatalı alanları kontrol edin.",
  "Data": null
}

- boş mail
{
  "ValidationErrors": [
    {
      "Key": "Email",
      "Value": "Lütfen bu alanı doldurun."
    }
  ],
  "HasError": true,
  "Message": "Lütfen hatalı alanları kontrol edin.",
  "Data": null
}
