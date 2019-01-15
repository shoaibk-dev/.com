---
title: "Refactoring Code - Day 1"
date: 2019-01-14T23:00:00+07:00
description: "Improving the design of existing code - my learning"
categories: ["Refactoring"]
tags: ["refactoring", "code", "clean", "test", "design", "vietnamese"]
image: "/images/2019/01/refactoring-code.jpg"
toc: false
---

Hôm rài qua nha ông anh chôm (mượn) được cuốn sách kinh điển gối đầu giường của dân Dev. Cuốn sách này là "REFACTORING" của Martin Fowler bản năm 1999 hướng dẫn trên ngôn ngữ Java (có bản 2018 mới trên cũng trên nền Java... nhưng thêm chữ Script 😁 - JavaScript, nhưng theo mình cảm nhận thì nó không tường minh như là trên Java). Và đây là bìa cuốn sách:

![Refactoring Book Cover 1999](/images/2019/01/refactoring-book-cover.jpg)

Hôm nay mình đọc được hết phần 1 gồm 52 trang đầu của sách và cảm nhận được mình học được rất nhiều từ phần này, sau đây là những ghi chép ngẫu hứng tóm tắt lại phần I của mình:

1. Refactoring bản chất là thay đổi cấu trúc code bên trong nhưng không thay đổi hành vi bên ngoài của code. (Nôm na là bạn học nhiều sẽ thông minh ra nhưng cơ thể bên ngoài vẫn phải vậy) => Vì thế đòi hỏi việc đầu tiên và quan trọng nhất trước khi refactoring là phải có một bộ test tốt.

1. Nhịp điệu chính (thần chú bạn luôn nên nhớ) khi làm refactoring là thay đổi nhỏ -> test -> thay đổi nhỏ -> test -> thay đổi nhỏ -> ... -> hoàn thành -> commit

1. Code tốt là code tự nó giải thích được bản thân nó là gì, làm gì và chạy ra sao. Và chìa khoá trong việc này là cách đặt tên biến và phương thức. (nếu mọi thứ chưa tường minh thì mới dùng comments) => Đừng ngại trong việc đổi tên nếu nó làm code tường minh, rõ ràng hơn.

1. Nên giải thoát cho các biến tạm thời không cần thiết, vì nó có thể bị lãng quên và dễ nảy sinh ra vấn đề sau này. => Có thể áp dụng chiến thuật "Replace Temp with Query"

1. Đừng ngại refactoring sẽ làm chậm chương trình cho tới khi bạn có số liệu profiler chính xác. Và lúc đó thì chuyện tối ưu cũng sẽ dễ hơn là tối ưu trên một đống hỗn tạp phải không?! => Khi refactoring thì tính rõ ràng được ưu tiên hơn hiệu suất.

1. Ưu tiên tách business logic ra khỏi giao diện để nâng cao tính tái sử dụng.

1. Và cuối cùng nhưng không kém quan trọng là mục tiêu chính của refactoring:

    - Làm code tinh gọn hơn
    - Rõ ràng hơn, minh bạch hơn (No magic)
    - Dễ test hơn
    - Sẵn sàng cho những thay đổi trong tương lai hơn

PHẦN NÀY TỚI ĐÂY LÀ HẾT RÙI !!

-------------------

Nếu bạn muốn mua và tìm đọc cuốn sách thì nhấn [vào đây](https://www.amazon.com/Refactoring-Improving-Design-Existing-Code/dp/0201485672)

Ref:

- Cover photo from Google Search
- "Refactoring - Improving Design Existing Code" book cover from [Amazon](https://www.amazon.com/Refactoring-Improving-Design-Existing-Code/dp/0201485672)