# Ứng dụng Flic

README này sẽ hướng dẫn bạn cách thiết lập và chạy dự án Flic trên máy tính cá nhân.

---

## Yêu cầu

- **.NET 8.0 SDK** (hoặc phiên bản tương thích)
- **SQL Server 2019** trở lên
- **Visual Studio 2022** (hoặc mới hơn) cài đặt workload **ASP.NET and web development**

---

## 1. Thiết lập Cơ sở dữ liệu

1. Mở **SQL Server Management Studio (SSMS)** và kết nối đến instance SQL Server của bạn.
2. Trong SSMS, chọn **File** > **Open** > **File...**, điều hướng đến file `csdl.sql` trong thư mục dự án và mở nó.
3. Nhấn **Execute** (hoặc **F5**) để chạy script. Script sẽ tạo schema và dữ liệu mẫu ban đầu.

---

## 2. Cấu hình

1. Mở Visual Studio và mở solution `flic.sln`.
2. Trong **Solution Explorer**, mở rộng project **Flic.Server** tìm các file:
   - `appsettings.json`
   - `appsettings.Development.json`
3. Cập nhật các phần sau trong cả hai file với thông tin của bạn:

   ```jsonc
   // Chuỗi kết nối tới cơ sở dữ liệu
   "ConnectionStrings": {
     "DefaultConnection": "Server=YOUR_SERVER;Database=YOUR_DATABASE;User Id=YOUR_USER;Password=YOUR_PASSWORD;"
   },

   // Cấu hình Email (Google)
   "EmailConfiguration": {
     "ApiKey": "YOUR_GOOGLE_API_KEY",
     "From": "your-email@example.com",
     "FromName": "Your App Name"
   },

   // Cấu hình VNPAY
   "Vnpay": {
     "Url": "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html",
     "TmnCode": "YOUR_TMN_CODE",
     "HashSecret": "YOUR_HASH_SECRET"
   }
   ```

4. Lưu lại các thay đổi.

---

## 3. Biên dịch Solution

1. Trong **Solution Explorer**, nhấp chuột phải vào node solution (`Flic`) và chọn **Build Solution**.
2. Đảm bảo không có lỗi trong cửa sổ **Output**.

---

## 4. Chạy Server

1. Nhấp chuột phải vào solution, chọn **Set Startup Projects...**.
2. Chọn **Single startup project**, sau đó chọn **Flic.Server**.
3. Nhấn **OK**.
4. Nhấn **F5** (hoặc **Run**) để khởi động API server. Mặc định sẽ chạy trên:
   - HTTPS: `https://localhost:5001`
   - HTTP: `http://localhost:5000`

---

## 5. Tài khoản Admin ban đầu

Sử dụng thông tin sau để đăng nhập vào khu vực Admin:

- **Username:** `usertest1234`
- **Password:** `Sothutu123@`

Sau khi đăng nhập, vào **Admin** → **Roles** để xem hoặc chỉnh sửa quyền của người dùng.

---

## Lỗi Thường Gặp

- **Không kết nối được đến SQL Server?** Kiểm tra lại chuỗi kết nối và đảm bảo dịch vụ SQL Server đang chạy.
- **Biên dịch lỗi?** Đảm bảo .NET SDK và workload của Visual Studio đã cài đặt đúng.
- **Cạnh tranh cổng (port)?** Nếu cổng 5021/5021 đã được sử dụng, bạn có thể thay đổi trong file `launchSettings.json` của project **Flic.Server**.

---

## License

Dự án này được cấp phép theo **MIT License**. Xem file [LICENSE](LICENSE) để biết chi tiết.

