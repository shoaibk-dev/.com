---
title: "[PHP 0 to 1] : Cơ bản về Web"
date: 2018-10-31T23:15:41+07:00
description: "Hiểu cơ bản về Web, nó vận hành như thế nào ?"
categories: ["php", "web"]
tags: ["php", "web", "vietnamese"]
image: "/images/2018/10/php-0-to-1.png"
toc: true

---

**Mục tiêu** : Nhằm hiểu ở mức nền tảng, cơ bản Web là gì và hoạt động ra sao

## Web là gì ?

Website (viết tắt là Web) là một tập hợp những trang mạng, bao gồm thông tin và nội dung số, thường được định danh bằng một tên miền và được xuất bản trên ít nhất một máy chủ mạng. Một Web có thể truy cập qua mạng với giao thức IP, thường là mạng Internet qua một đường dẫn định vị tài nguyên (URL = Uniform Resource Locator).

Mục đích của Web là để đăng tải, chia sẻ, giao dịch và xử lý thông tin số thông qua mạng máy tính.

## Internet hoạt động thế nào ? (Internet Protocol)

Mạng internet là mạng giữa các máy tính được kết nối với nhau trực tiếp hay gián tiếp thông qua các điểm trung chuyển khác nhau tạo thành một mạng lưới kết nối rộng lớn. Mỗi máy trực tiếp tham gia vào mạng sẽ được cấp một địa chỉ IP (địa chỉ IPv4 có dạng A.B.C.D với A,B,C,D từ 0-255) duy nhất trong hệ thống mạng. Vì vậy việc gửi dữ liệu từ máy A sáng máy B là việc gửi từ địa chỉ IP của máy A sang địa chỉ IP của máy B. Do các dữ liệu được trung chuyển qua các điểm máy trung gian trong mạng máy tính vì không có đường hướng cụ thể, công đoạn này gọi là Routing. Dữ liệu sẽ được gửi dưới dạng các gói tin từ IP A sang IP B qua hệ thống Routing toàn cầu.

Do việc trung chuyển gói tin qua nhiều điểm mới tới đích, vì thế việc đảm bảo gói tin được toàn vẹn 100% là điều không thể (mà chỉ đảm bảo ở mức nỗ lực cố gắng cao nhất có thể). Vì thế dễ dẫn đến tình trạng gói tin bị mất mát, chỉnh sửa, trùng lặp và sai thứ tự trong quá trình trung chuyển trong mạng máy tính. Vì vậy mà các ứng dụng mạng muốn đảm bảo tính chính xác toàn vẹn dữ liệu được xây dựng trên một lớp Protocol bên trên bao gồm các cơ chế và quy tắc để đạt được tính toàn vẹn này, điển hình là giao thức TCP (Transmission Control Protocol).

## HTTP Protocol

HTTP Protocol (HyperText Transfer Protocol) là giao thức truyền tải **siêu văn bản** (nghe có vẻ vi diệu), nó được xây dựng trên nền tảng giao thức TCP để đảm bảo tính toàn vẹn của dữ liệu giữa 2 máy (thường gọi là máy chủ Server và máy khách Client).

### Request

Đầu tiên Client sẽ kết nối tới Server thông qua một cổng nhất định do máy chủ cung cấp dịch vụ HTTP (thường là cổng 80). Sau khi kết nối thành công, Client sẽ chuyển tiếp *yêu cầu về dữ liệu* (Request) mà nó muốn gửi lên cho Server xử lý. Request đó sẽ bao gồm 2 phần là đầu (HTTP Headers) và thân (HTTP Body).

Ví dụ như sau :

```
POST /du-lieu HTTP/1.1
Host: example.com
User-Agent: curl/7.54.0
Accept: */*

username=admin&password=secret
```

Bên trên là một HTTP Request bao gồm 2 phần :

- Phần Header bao gồm 4 dòng đầu, dòng đầu tiên đặc biệt theo nguyên tắc là `[METHOD] [URL] HTTP/[HTTP_VERSION]`, cung cấp cho ta biết phương thức gửi là gì (POST), điểm cuối chứa dữ liệu (/du-lieu) và phiên bản HTTP (1.1). Các dòng tiếp theo của Header theo nguyên tắc là `KEY: VALUE` nhằm cung cấp thông tin thêm cho Server hiểu chính xác Client đang cần gì, muốn gì và chấp nhận định dạng trả về như thế nào.
- Phần Body dòng thứ 6 trở xuống, dòng thứ 5 là dòng trắng để ngăn cách Header và Body. Phần này chứa những thông tin dữ liệu kèm theo đầy đủ của Request.

### Response

Sau khi nhận được Request từ Client, Server sẽ xử lý tính toán và trả về cho Client một trả lời (Response). Response này cũng bao gồm 2 phần như Request là Header và Body

Ví dụ như sau :

```
HTTP/1.1 200 (OK)
Server: nginx
Date: Wed, 31 Oct 2018 08:07:09 GMT
Content-Type: text/plain; charset=utf-8;
Content-Length: 11
Connection: keep-alive
Access-Control-Allow-Origin: *
Cache-Control: max-age=300

hello
world
```

- Phần Header bao gồm 8 dòng đầu, dòng đầu tiên đặc biệt theo nguyên tắc là `HTTP/[HTTP_VERSION] [STATUS CODE] [STATUS TEXT]`, cung cấp cho ta biết phiên bản HTTP (1.1), trạng thái của response qua 3 con số được quy định theo chuẩn [RFC 7231](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes) và chú thích cho trạng thái. Các dòng tiếp theo của Header theo nguyên tắc là `KEY: VALUE` nhằm cung cấp thông tin thêm cho Client hiểu chính xác Server trả về định dạng gì, độ dài bao nhiêu và một số quy tắc khác.
- Phần Body dòng thứ 10 trở xuống, dòng thứ 9 là dòng trắng để ngăn cách Header và Body. Phần này chứ những thông tin dữ liệu kèm theo đầy đủ của Response.

### Mô phỏng Request và Response dùng công cụ telnet

Bên dưới mình sẽ dùng công cụ telnet để request URL như sau `http://web.mit.edu/robots.txt`, địa chỉ IP (104.69.158.90) bên dưới do mình dùng `ping web.mit.edu` mà có được, cái này mình sẽ giải thích ở phần DNS bên dưới.

Xem tại đây : https://asciinema.org/a/9rx2RxlbmCUuRPilVu4jno9v4

{{< asciinema 9rx2RxlbmCUuRPilVu4jno9v4 >}}

## Hosting, Domain, DNS, Database, HTTPS

### Hosting

Hosting là nơi chứa dữ liệu, mã nguồn của trang web. Hosting sẽ nằm trên Server vật lý, và Server này sẽ chia sẻ tài nguyên bao gồm CPU, bộ nhớ và đĩa cứng để phục vụ cho vận hành Website. Có thể xem Hosting là một miếng đất để xây dựng một cái khung nhà (Source Code) trên mảnh đất đó.

### Tên miền (Domain Name) và DNS

Như các bạn đã biết Client và Server nói chuyện với nhau qua một kết nối giữa IP của Client và IP của Server. Đồng nghĩa là nếu Client không có, không nhớ địa chỉ IP của Server thì coi như không thể thiết lập kết nối. Do đó người ta đã lập trên một cách dễ nhớ hơn là tạo nên một cuốn sổ danh bạ địa chỉ IP, cơ chế tạo nên cuốn sổ danh bạ này gọi là DNS (Domain Name Resolvers) hay còn gọi là quá trình phân giải tên miền thành địa chỉ IP.

Khi bạn truy cập vào một tên miền dễ nhớ như abc.com, thì lập tức Client sẽ dùng một dịch vụ phân giải DNS của các nhà mạng để tra trong cuốn danh bạ rằng abc.com là địa chỉ IP nào. Sau khi có được địa chỉ IP này, Client sẽ thiết lập kết nối tới địa chỉ IP đó. Nếu không tìm ra địa chỉ IP, Client sẽ báo ra một lỗi là "Thất bại trong quá trình phân giải DNS hoặc tên miền này không tồn tại".

Ngoài tính năng là tạo sự dễ nhớ, domain còn giúp cho một Server chạy được rất nhiều trang web với domain khác nhau chỉ với 1 địa chỉ IP. Lúc này Web Server sẽ phân biệt domain nào cho dữ liệu nào dựa vào HTTP Header `Host: abc.com` mà Client gửi lên lúc tạo Request. Như thế, số lượng trang web với domain khác nhau sẽ không bị phụ thuộc vào số địa chỉ IP (tối đa là 255^4 địa chỉ IPv4 , về địa chỉ IPv6 bạn có thể tìm hiểm thêm trên Google).

### Database

Database (cơ sở dữ liệu), cái tên này sẽ làm nhiều người lầm tưởng hay mặc định là những phần mềm database lớn như MSSQL, MySQL hay Oracle với hàng triệu dòng mới gọi là database. Nhưng định nghĩa của Database đơn giản chỉ là một nơi có khả năng lưu trữ, hỗ trợ thao tác đọc và ghi dữ liệu vào bộ nhớ lưu trữ. Ví dụ như một file text đơn giản, một file csv, một file excel, một file sqlite, một server MySQL hoặc một server Key-Value đều được gọi là database.

Tuỳ theo nhu cầu mà người phát triển sẽ lựa chọn cho mình một database phù hợp chứ không có một database nào là bá đạo hạt gạo, xịn nhất cả.

### HTTPS

Dạo gần đây, khái niệm này mới thật sự nổi lên như một làn sóng về bảo mật thông tin cá nhân. HTTP(S) với chứ S là Secure nghĩa là bảo mật, an toàn hơn.

Như các bạn cũng đã thấy ở phần trên về HTTP, mọi dữ liệu kể cả Request lẫn Response đều được truyền giữa Client và Server dưới dạng là plain text (chữ thường) không được mã hoá. Vì thế nảy sinh ra rủi ro dữ liệu sẽ bị nghe lén, đánh cắp hoặc thậm chí là sửa đổi trên đường trung chuyển qua các nốt trung gian trong hệ thống mạng mà Client và cả Server không hề hay biết.

HTTPS sử dụng công nghệ bảo mật là SSL (hoặc mới nhất là TLS) để mã hoá và chứng thực kết nối giữa Client và Server là an toàn và bảo mật. Về cơ chế làm việc của HTTPS nói riêng là TLS nói chung mình sẽ nói sâu hơn trong một chuyên đề nâng cao về bảo mật.