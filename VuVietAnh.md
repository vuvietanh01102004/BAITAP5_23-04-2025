# BÀI TẬP VỀ NHÀ 05, Môn Hệ quản trị csdl.

## SUBJECT: Trigger on mssql

## A. Trình bày lại đầu bài của đồ án PT&TKHT:
1. Mô tả bài toán của đồ án PT&TKHT, đưa ra yêu cầu của bài toán đó
2. Cơ sở dữ liệu của Đồ án PT&TKHT :
   Có database với các bảng dữ liệu cần thiết (3nf), các bảng này đã có PK, FK, CK cần thiết
 
## B. Nội dung Bài tập 05:
1. Dựa trên cơ sở là csdl của Đồ án
2. Tìm cách bổ xung thêm 1 (hoặc vài) trường phi chuẩn
   (là trường tính toán đc, nhưng thêm vào thì ok hơn,
    ok hơn theo 1 logic nào đó, vd ok hơn về speed)
   => Nêu rõ logic này!
3. Viết trigger cho 1 bảng nào đó, 
   mà có sử dụng trường phi chuẩn này,
   nhằm đạt được 1 vài mục tiêu nào đó.
   => Nêu rõ các mục tiêu 
4. Nhập dữ liệu có kiểm soát, 
   nhằm để test sự hiệu quả của việc trigger auto run.
5. Kết luận về Trigger đã giúp gì cho đồ án của em.
## DEADLINE: 23H59:59 NGÀY 23/04/2025

# Bài làm
## A. Trình bày lại đầu bài của đồ án PT&TKHT
1. Mô tả bài toán của đồ án PT&TKHT, đưa ra yêu cầu của bài toán đó
- Tên đồ án: Phân tích thiết kế hệ thống quản lý đồ án sinh viên trường đại học kĩ thuật Công Nghiệp.
- Yêu cầu: Hệ thống giúp sinh viên đăng ký, theo dõi đồ án, giảng viên hướng dẫn và đánh giá, đồng thời cung cấp báo cáo hỗ trợ quản lý.
2. Cơ sở dữ liệu của Đồ án PT&TKHT
- Tạo Database có tên là QLDoAnSinhVien:
![image](https://github.com/user-attachments/assets/c28e4a9d-0f9f-4007-aabf-790df547952d)
- Tạo database diagram có đủ các khoá cần thiết:
![image](https://github.com/user-attachments/assets/38fe6fe4-0b00-479c-ab7e-e6efbee48d8d)
- Bảng DeTai: MaDT là khoá chính (PK)
![image](https://github.com/user-attachments/assets/6395c599-3747-4c9a-b78d-45057e2315f2)
- Bảng DoAn: MaDA là khoá chính (PK)
![image](https://github.com/user-attachments/assets/cf659b72-7549-448b-89b2-1e17bf284d2f)
- Bảng GiangVien: MaGV là khoá chính (PK)
![image](https://github.com/user-attachments/assets/1bbf06b3-598a-4b8e-8aca-3e87c9b98787)
- Bảng PhanBien: MaDA là khoá chính (PK), MaGV là khoá ngoại (FK)
![image](https://github.com/user-attachments/assets/c62e9fb7-52e8-442f-acef-d31a349d9211)
- Bảng PhanCong: MaDA là khoá chính (PK), MaSV và MaGV là khoá ngoại (FK)
![image](https://github.com/user-attachments/assets/beb87047-0364-4f03-b05a-2424b90a8944)
- Bảng SinhVien: MaSV là khoá chính (PK)
![image](https://github.com/user-attachments/assets/87eae538-7184-4e9e-9b21-89bf8cfa330e)
## B. Nội dung bài tập 5
1. CSDL đồ án đã dựa trên phần A
2. Thêm trường phi chuẩn GhiChu vào bảng DoAn:
![image](https://github.com/user-attachments/assets/ed0111c7-121c-42ff-a1d5-174c7f47d1e2)
![image](https://github.com/user-attachments/assets/e9c9f9ee-12f5-4ffa-aebc-ee469a780626)
Sau khi thêm trường GhiChu vào bảng DoAn, bạn nên ghi một kết luận ngắn gọn để thể hiện rõ ý định và tính hợp lý của thay đổi này, đặc biệt nếu bạn đang làm báo cáo môn Phân tích và Thiết kế Hệ thống.
- Kết luận:
 + Việc bổ sung trường GhiChu vào bảng DoAn giúp hệ thống linh hoạt hơn trong việc ghi nhận các thông tin bổ sung, như nhận xét từ giảng viên, các lưu ý đặc biệt trong quá trình thực hiện đồ án, hoặc các ghi chú nội bộ khác.
 + Trường này không bắt buộc nhập (có thể để trống), phù hợp với tiêu chí mở rộng hệ thống theo hướng dễ bảo trì và tùy biến trong tương lai. Đây là một trường "phi chuẩn" nhưng hữu ích trong thực tế triển khai.
3. Viết Trigger cho 1 bảng nào đó
Mục tiêu của việc tạo trigger cho bảng dbo.DoAn trong hệ thống quản lý đồ án sinh viên có thể bao gồm:
- Đảm bảo tính toàn vẹn dữ liệu:
 + Kiểm tra rằng sinh viên thực hiện và giảng viên hướng dẫn tồn tại trước khi chèn một đồ án mới.
 + Ngăn chặn việc xóa một đồ án nếu nó đã có đánh giá hoặc tài liệu tham khảo liên quan.
- Tự động cập nhật dữ liệu:
 + Khi một đồ án được cập nhật trạng thái (Ví dụ: "Đang thực hiện" → "Hoàn thành"), hệ thống có thể tự động cập nhật ngày hoàn thành.
 + Khi một sinh viên đăng ký đồ án, có thể tự động cập nhật trạng thái của sinh viên thành "Đang làm đồ án".
- Ghi log và theo dõi thay đổi:
 + Lưu lại các thay đổi vào một bảng lịch sử (LichSuDoAn) để phục vụ kiểm tra sau này.
 + Kiểm tra nếu giảng viên bị thay đổi, hệ thống sẽ lưu thông tin cũ trước khi cập nhật mới.
![image](https://github.com/user-attachments/assets/74f78c27-c166-404f-a746-09ebb60e95bc)
4. Nhập dữ liệu
![image](https://github.com/user-attachments/assets/90180503-55f2-4d7d-8f61-788e7d95a818)
5. Kết luận về trigger
Trigger trong hệ thống quản lý đồ án sinh viên đóng vai trò quan trọng trong việc đảm bảo tính toàn vẹn dữ liệu, tự động hóa quy trình và duy trì logic nghiệp vụ của hệ thống
- Đảm bảo tính toàn vẹn dữ liệu:
 + Ngăn chặn lỗi nhập dữ liệu sai, chẳng hạn như ngày kết thúc nhỏ hơn ngày bắt đầu.
 + Hạn chế sinh viên đăng ký nhiều hơn một đồ án, giúp duy trì quy tắc học tập.
 + Ngăn chặn xóa đồ án nếu đã có đánh giá hoặc tài liệu liên quan.
- Tự động hóa quy trình:
 + Khi sinh viên đăng ký đồ án, trigger có thể tự động cập nhật trạng thái của sinh viên thành "Đang thực hiện đồ án".
 + Nếu trạng thái đồ án đổi thành "Hoàn thành", hệ thống có thể tự động cập nhật ngày kết thúc.
 + Khi giảng viên thay đổi hướng dẫn, trigger có thể ghi log lịch sử thay đổi.
- Kiểm soát và giám sát dữ liệu:
 + Ghi lại lịch sử sửa đổi và cập nhật dữ liệu đồ án, giúp kiểm tra nguồn gốc thay đổi.
 + Cảnh báo khi sinh viên chưa có giảng viên hướng dẫn hoặc thiếu thông tin cần thiết.
## ==> Trigger giúp hệ thống vận hành thông minh hơn, giảm thiểu lỗi nhập dữ liệu, tự động hóa các quy trình quan trọng và giúp đảm bảo rằng hệ thống tuân thủ đúng quy tắc quản lý đồ án.











 















