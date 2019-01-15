---
title: "Refactoring Code - Day 2"
date: 2019-01-15T16:00:00+07:00
description: "Improving the design of existing code - my learning"
categories: ["Refactoring"]
tags: ["refactoring", "code", "clean", "test", "design", "vietnamese"]
image: "/images/2019/01/refactoring-code.jpg"
toc: false
---

Hôm nay mình tiếp tục đọc phần II của cuốn sách "Priciples in Refactoring". Phần này có lẽ là phần quan trọng nhất của cuốn sách nên mình sẽ đọc và nghiền ngẫm từ từ từng mục một. Dưới đây là những ghi chép ngẫu hứng tóm tắt lại 2 mục con của phần II:

### Định nghĩa của Refactoring

1. Refactoring là thay đổi cấu trúc bên trong của phần mềm làm cho nó "dễ hiểu hơn" và "rẻ hơn" cho việc thay đổi mà không thay đổi hành vi có thể quan sát được => End-user sẽ không thể cảm nhận có sự thay đổi bên trong phần mềm.

1. Refactoring giống với Performance Optimization là thay đổi cấu trúc bên trong mà không thay đổi hành vi quan sát được. Nhưng lại khác nhau về mục đích: Performance Optimization thường làm code khó hiểu hơn để đổi lại hiệu năng khi cần thiết.

### Tại sao phải dùng Refactoring?!

1. Cải thiện thiết kế phần mềm. Refactoring thường xuyên sẽ giúp code giữ nguyên được hình dáng của thiết kế. Không những thế nó giúp làm tinh gọn những thiết kế nghèo nàn bằng cách giảm đi sẽ lặp đi lặp lại để đảm bảo rằng code chỉ thể hiện đúng 1 và chỉ 1 hành vi duy nhất của nó. Đó là bản chất của một thiết kế tốt.

1. Làm cho phần mềm dễ hiểu hơn. Dù muốn hay không thì dự án phần mềm sẽ luôn xuất hiện thêm kể thứ 3 ngoài bạn và khách hàng, đó là những lập trình viên khác trong tương lai. Vì thế việc máy tính phải xử lý thêm vài vòng tính toán làm nó chậm đi cũng không quan trọng bằng vấn đề một thay đổi phải mất hàng tháng mà lẽ ra chỉ mất hàng giờ hết người lập trình viên hiểu rõ code của bạn. Ngoài ra, hãy dùng code để diễn tả ý tưởng của bạn, biến code trở thành công cụ ghi chép chủ đạo chứ không phải ghi nhớ trong trí nhớ hoặc viết vào một nơi khác.

1. Giúp bạn tìm ra bugs dễ hơn. Một khi đã hiểu rõ code một cách rõ ràng, bạn sẽ phần nào đó xoá bở bớt những giả tưởng mơ hồ về hệ thống, từ đó có thể tìm ra lỗi dễ dàng hơn.

1. Giúp bạn lập trình nhanh hơn (trong tương lai). Một thiết kế hệ thống tốt là thiết yếu cho việc phát triển nhanh hệ thống. Refactoring giúp cải thiện thiết kế hệ thống, giúp bạn đi theo đúng thiết kế => nó sẽ làm tăng tốc độ phát triển hệ thống lên là điều tất yếu!

*Hôm nay mình chỉ đọc đến đây thôi vì phần này quan trọng mình không muốn sẽ bị quá tải về kiến thức, "giục tốc bất đạt" mà ;) có thể bạn sẽ thấy mình lặp ý trong các bài liên tục, cái này mình sẽ tổng hợp lại sau khi lĩnh hội xong cuốn sách :)*

-------------------

Nếu bạn muốn mua và tìm đọc cuốn sách thì nhấn [vào đây](https://www.amazon.com/Refactoring-Improving-Design-Existing-Code/dp/0201485672)

Ref:

- Cover photo from Google Search
