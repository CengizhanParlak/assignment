# assignment

A new Flutter project.

## Bilgiler

- Kullanıcı mail: cengdeneme@gmail.com
Şifre: 123456
Token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MjFmOTlkOGIwN2QxZTEzOWFmNWI0Y2YiLCJuYmYiOjE2NDYyMzgxNjgsImV4cCI6MTY0ODgzMDE2OCwiaXNzIjoiaSIsImF1ZCI6ImEifQ.lpmO04HwFmExg9JCVMsKznbhMCq6sidIiOS5WvDRft8

- Kullanıcı mail: cengtest@gmail.com
Şifre: 123456
Token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MjFmOWMxOWIwN2QxZTEzOWFmNWI0ZDAiLCJuYmYiOjE2NDYyMzg3NDUsImV4cCI6MTY0ODgzMDc0NSwiaXNzIjoiaSIsImF1ZCI6ImEifQ.jEXOhFRqGYB50SYigh5fzsSpFJVWY88VeabkKojRmOI

## API cevapları

/General/UploadImage POST

Başarılı istek:

{
  "ValidationErrors": [],
  "HasError": false,
  "Message": "Yükleme başarılı.",
  "Data": "https://blinck.s3.eu-central-1.amazonaws.com/uploads/profilePhoto/f1443978-b048-43ad-b726-ca8f10817210.png"
}

/Account/Get GET

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
