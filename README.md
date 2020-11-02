# Save Money

พัฒนาแอปพลิเคชันด้วย Flutter

## ผู้พัฒนาแอปพลิเคชัน
- รหัสนิสิต 60023179 นางสาว อัฉฎาภรณ์ สงวนทอง

## รายละเอียดระบบ

### หน้า Login

![Screenshot-Login](https://user-images.githubusercontent.com/55909533/97852445-544b0780-1d29-11eb-898c-46fbf0eed7a7.jpg)
- หน้า login ได้ใช้ Firebase Realtime Database เพื่อเข้าสู่ระบบใช้งาน 
  - ผู้ใช้มีบัญชีแล้วสามารถกรอก E-mail และ Password เพื่อเข้าสู่ระบบใช้งาน
  - ผู้ใช้ที่ยังไม่บัญชี สามารถกดที่ปุ่ม "Register" 

### หน้า Register

![Screenshot-Register](https://user-images.githubusercontent.com/55909533/97854115-9bd29300-1d2b-11eb-9f07-2eecc1b0481b.jpg)
- หน้าสมัครสมาชิก ได้ใช้ Firebase Realtime Database และเชื่อมกับ Firebase Authentication เพื่อเข้าสู่ระบบใช้งาน 
  - ผู้ใช้กรอก E-mail, Username, Password, Confrimpassword หลังจากนั้นกดปุ่ม Register พลิเคชันจะกลับไปยังหน้า Login เพื่อกรอกฟอร์มเข้าสู่ระเบบ
  
### Firebase Authentication ใช้กับหน้าเข้าสู่ระบบและหน้าสมัครสมาชิก 
![Screenshot-Au](https://user-images.githubusercontent.com/55909533/97855266-16e87900-1d2d-11eb-91aa-64cec2d68649.jpg)

### หน้าบัญชีผู้ใช้(เพิมเงินออม)

![Screenshot-Addmoney](https://user-images.githubusercontent.com/55909533/97869056-5cb03c00-1d43-11eb-97c2-4d9542f7ffdd.jpg)
- เพิ่มจำนวนเงิน 
  
### หน้าบัญชีผู้ใช้(เพิมเงินออม)
  
![Screenshot-AddCommit](https://user-images.githubusercontent.com/55909533/97869179-941ee880-1d43-11eb-9ad1-81acd5f5a474.jpg)
- เมื่อเพิ่มจำนวนเงินสำเร็จ

  
### หน้าประวัติการเพิ่มเงิน
 
![Screenshot-Statement](https://user-images.githubusercontent.com/55909533/97869255-bc0e4c00-1d43-11eb-9c85-beb6c30fa7db.jpg)

  
 ### หน้ายอดเงินรวม
  
 ![Screenshot-Total](https://user-images.githubusercontent.com/55909533/97870108-0d6b0b00-1d45-11eb-9e65-ee33c59c51e3.jpg)
 - ยอดเงินรวมทั้งหมดที่เพิ่ม


