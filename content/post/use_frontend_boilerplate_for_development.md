+++
date = "2016-06-13T18:12:50+07:00"
title = "Sử dụng Frontend Boilerplate cho việc cắt HTML Layout"
description = "Khi cắt HTML Layout từ PSD, bạn sẽ đối mặt với việc bên Design hoặc khách hàng thường xuyên yêu cầu thay đổi giao diện, thiết kế. Điều này gây ra không ít phiền nhiễu và tốn thời gian nếu cứ cập nhật hàng tá giao diện nếu sự thay đổi ảnh hưởng đến những phần layout chính (header, footer, sidebar)."
categories = ["web"]
tags = ["web", "frontend", "php", "vietnamese"]
image = "2016/06/html5-boilerplate.jpg"
toc = true
+++

## Giới thiệu

Khi cắt HTML Layout từ PSD, bạn sẽ đối mặt với việc bên Design hoặc khách hàng thường xuyên yêu cầu thay đổi giao diện, thiết kế. Điều này gây ra không ít phiền nhiễu và tốn thời gian nếu cứ cập nhật hàng tá giao diện nếu sự thay đổi ảnh hưởng đến những phần layout chính (header, footer, sidebar).

Sử dụng bộ khung sườn (boiler-plate) này, sẽ giúp bạn hạn chế thao tác lặp đi, lặp lại. Lẫn hỗ trợ cho bên backend đổ dữ liệu vào sau này (hoặc chính bạn là người đổ dữ liệu).

## Yêu cầu

- PHP 5.4+
- Composer

## Cài đặt

1. Clone hoặc download repo `frontend-boilerplate` tại đây : https://github.com/khanhicetea/frontend-boilerplate

```bash
git clone https://github.com/khanhicetea/frontend-boilerplate.git
```

2. Cài đặt các packages cần thiết (PHP Twig)

```bash
cd frontend-boilerplate
composer install
```

## Khởi động

Chạy câu lệnh sau để chạy một server localhost (port default là 8080)
```bash
php -S 127.0.0.1:8080 index.php
```

## Quy ước phát triển

- Cú pháp phát triển template : http://twig.sensiolabs.org/doc/templates.html
- Mỗi project sẽ có 1 folder riêng, trong đó có 2 folder để bạn phát triển giao diện :
  - folder `templates` : template html .
  - folder `assets` : các file css, js & hình ảnh

Khi cần duyệt layout nào bạn vào trình duyệt gõ `http://localhost:8080/[tên-file].html`

## Ví dụ

- Tạo folder cho project mới `test`
- Chạy lệnh sau để chạy server : `php -S localhost:8080 -t test index.php`, với `test` là tên folder của project mới tạo.

File `test/templates/layout.html`

```html
<!DOCTYPE html>
<html>
<head>
	<title>Hello World</title>
	{% include 'blocks/header.html' %}

	{% block header_scripts %}	
	{% endblock %}
</head>
<body>
	{% block main_content %}
	{% endblock %}
</body>
</html>
```

File `test/templates/blocks/header.html`

```html
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
```

File `test/assets/css/style.css`

```html
body {
	text-align: center
}

h1 {
	font-size: 100px
}
```

File `test/test.html`

```html
{% extends 'layout.html' %}

{% block header_scripts %}
	<link rel="stylesheet" type="text/css" href="/assets/css/style.css">
	<script type="text/javascript">
		$(document).ready(function() {
			$('h1').css('color', 'blue');
		});
	</script>
{% endblock %}

{% block main_content %}
	<h1>This is test !</h1>
{% endblock %}
```

Vào trình duyệt và gõ http://localhost:8080/test.html

## Xuất ra HTML để gửi demo

Khi bạn cần xuất ra giao diện để gửi cho khách hàng hoặc bên duyệt layout, chỉ cần chạy câu lệnh sau :

```shell
php build.php test r
```

- `test` là tên project cần export
- `r` là chế độ thay đổi link của các assets từ **absolute** sang **relative**

Tất cả layout + assets sẽ được xuất ra folder `dist` trong folder project. Nén folder này là có thể gửi đi bất ký đâu.

> Happy Coding !!! ¯\_(ツ)_/¯
