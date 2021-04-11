create database webtracnghiem ;
use webtracnghiem;
create table user(
	id INT(10) NOT NULL auto_increment,
	name varchar(50),
    email varchar(50),
    phone INT(11),
	username varchar(50),
	password_hash varchar(50),
    total_score int(10),
    level varchar(50),
    primary key (id)
);

create table question(
	id INT(10) NOT NULL auto_increment,
	content varchar(200),
    difficuty int(10),
    category varchar(50),
	primary key (id)
);

create table answer(
	id INT(10) NOT NULL auto_increment,
	id_question INT(10),
	content varchar(200),
	statú boolean,
    primary key (id),
    FOREIGN KEY (id_question) REFERENCES question(id)
);

INSERT INTO question (id, content) VALUES
(1, 'Sự khác nhau cơ bản giữa truyền thông multicast và truyền thông broadcast là gì?'),
(2, 'Giao thức nào sử dụng địa chỉ IP là 224.0.0.5 và 224.0.0.6 cho truyền thông multicast?'),
(3, 'Sử dụng Internet Group Management Protocol version 2 (IGMPv2), một nút mạng làm thế nào để thoát ra hoặc ngừng tham gia vào một nhóm multicast?'),
(4, 'Constructor là gì?'),
(5, 'Đâu là cách khai báo tạo ra chuỗi ký tự?'),
(6, 'Phương thức getInetAddress() trong lớp Socket được dùng để làm gì?'),
(7, 'Phương thức replaceFirst(char old, char new) được dùng để làm gì?'),
(8, 'Mô hình Client - Server thỏa mãn điều kiện nào?'),
(9, 'Chương trình được viết bằng ngôn ngữ Java có thể chạy trên bất kỳ nền nào bởi vì…'),
(10, 'Phương thức getPort() trong lớp URL có ý nghĩa gì ?'),
(11, 'Mô hình Client - Server thỏa mãn điều kiện nào?'),
(12, 'Chương trình được viết bằng ngôn ngữ Java có thể chạy trên bất kỳ nền nào bởi vì…'),
(13, 'Phương thức getPort() trong lớp URL có ý nghĩa gì?'),
(14, 'Phương thức getData() trong lớp DatagramPacket được sử dụng với mục đích gì?'),
(15, 'Lớp String thuộc package nào?'),
(16, 'Phương thức getPort() trong lớp DatagramPacket được sử dụng với mục đích gì?'),
(17, 'Điền vào phần ... cho phát biểu sau: "Mỗi gói dữ liệu chứa các thông tin: Dữ liệu, chiều dài gói, ...., và số cổng"'),
(18, 'Điền vào phần ... cho phát biểu sau: "Mỗi gói dữ liệu chứa các thông tin:..., chiều dài gói, địa chỉ IP, và số cổng"'),
(19, 'Điền vào phần …… cho phát biểu sau: "Mỗi gói dữ liệu chứa các thông tin: Dữ liệu, ……, địa chỉ IP, và số cổng"'),
(20, 'Điền vào phần ... cho phát biểu sau: "Mỗi gói dữ liệu chứa các thông tin: Dữ liệu, chiều dài gói, địa chỉ IP , và ...."'),
(21, 'Các định nghĩa phương thức sau đây định nghĩa nào sai:'),
(22, 'Trong cùng một máy có nhiều ứng dụng mạng cùng chạy, để phân biệt các ứng dụng với nhau thường dùng thông số nào sau đây?'),
(23, 'Điền phần còn thiếu cho cú pháp hàm sau DatagramPacket( …… buf[], int len) trong lớp DatagramPackage'),
(24, 'Mỗi gói dữ liệu trong lập trình mạng chứa thông tin gì?'),
(25, 'Phương thức writeBytes( String v) trong lớp DataOutputStream được sử dụng với mục đích gì?'),
(26, 'Phương thức getPort( ) trong lớp Socket được dùng để làm gì?'),
(27, 'Phương thức ServerSocket(int port, int count) trong lớp ServerSocket được sử dụng với mục đích gì?'),
(28, 'Lớp Soket trong lập trình mạng được sử dụng khi viết chương trình bên phía máy nào trong lập trình theo mô hình Client/Server:'),
(29, 'Phuương thức writeInt( int v)trong lớp DataOutputStream được sử dụng với mục đích gì?'),
(30, 'Điền phần còn thiếu cho cú pháp hàm sau: DatagramPacket( byte buf..., int len) trong lớp DatagramPackage'),
(31, 'Điền phần còn thiếu cho cú pháp hàm sau: DatagramPacket( byte buf[], ...len) trong lớp DatagramPackage'),
(32, 'Lớp nào cung cấp các phương tiện để người sử dụng có thể truy nhập được vào môi trường OSI và cung cấp các dịch vụ thông tin phân tán'),
(33, 'Tầng nào trong mô hình OSI làm việc với các tín hiệu điện?'),
(34, 'Để cấp phát động địa chỉ IP, ta có thể sử dụng dịch vụ có giao thức nào:'),
(35, 'Protocol là?'),
(36, 'Mô hình Client - Server là mô hình như thế nào?'),
(37, 'Java chạy trên hệ điều hành nào sau đây:'),
(38, 'Lệnh if CONDITION { Khối lệnh } có tác dụng gì?'),
(39, 'Kiểu dữ liệu byte có phạm vi trong khoảng nào?'),
(40, 'Lệnh str.charat(n) có tác dụng gì?'),
(41, 'Lệnh result = condition ? value1 : value2 có nghĩa gì?'),
(42, 'Để kiểm tra 2 chuỗi có bằng nhau hay không, sử dụng phương thức nào?'),
(43, 'Mục đích chính của các câu lệnh import là….'),
(44, 'Biên dịch có lỗi và đưa ra thông báo lỗi "Duplicate main() method declaration"'),
(45, 'Lớp là gì?'),
(46, 'Để khai báo lớp Xedap1 kế thừa lớp Xedap phải làm nhưthế nào?'),
(47, 'Cách đặt tên nào sau đây là không chính xác?'),
(48, 'Phương thức hasNext() trong lớp Scanner có tác dụng?'),
(49, 'Lệnh khai báo Scanner in = new Scanner(System.in); có tác dụng gì?'),
(50, 'Phương thức nextInt() trong lớp Scanner có tác dụng?');

INSERT INTO answer (id, id_question, content, state) VALUES 
(1, 1, 'Multicast là gửi cho nhiều mạng được định nghĩa với multicast.', true),
(2, 1, 'Multicast và broadcast về cơ bản là giống nhau.', false),
(3, 1, 'Broadcast là gửi cho mọi nút mạng có đăng ký nhóm và/hoặc mạngcon.', false),
(4, 1, 'Không phải các ý trên.', false),
(5, 2, 'PIM.', false),
(6, 2, 'OSPF.', true),
(7, 2, 'EIGRP.', false),
(8, 2, 'Không phải các ý trên', false),
(9, 3, 'Nó phải tự thoát ra vì không có câu lệnh để thoát ra nhóm.', false),
(10, 3, 'Cả nút và router phải được cấu hình với quyền admin để không tham gia vào một nhóm multicast cụ thể.', false),
(11, 3,'Nút không kiểm soát được việc tham gia nhóm multicast; router hoàn toàn quản lý nhóm multicast.', false),
(12, 3, 'Nút phải đưa ra một câu lệnh nghỉ cụ thể.', true),
(13, 4, 'Các hàm có tên trùng với tên lớp và không có tham số.', false),
(14, 4, 'Các hàm có tên trùng với tên lớp và không có kiểu dữ liệu của hàm.', true),
(15, 4, 'Hàm có tên trùng với tên lớp, kiểu dữ liệu của hàm là void', false),
(16, 4, 'Hàm có tên trùng tên lớp và có dấu ngã ~ trước tên hàm.', false),
(17, 5, 'String s = new String("Test")', false),
(18, 5,'String s;', false),
(19, 5,'Cả hai phương án đều đúng', true),
(20, 5,'Cả hai phương án đều sai', false),
(21, 6,'Lấy về số cổng được kết nối đến máy chủ', false),
(22, 6,'Lấy về luồng xuất để máy khách có thể gửi dữ liệu đến máy chủ', false),
(23, 6,'Lấy về luồng nhập để máy khách có thể đọc dữ liệu gửi trả về từ phía máy chủ', false),
(24, 6,'Lấy địa chỉ của máy chủ được kết nối đến dưới dạng kiểu InetAddress', true),
(25, 7,'Thay thế tất cả ký tự new bằng ký tự old trong một chuỗi nào đó', false),
(26, 7,'Thay thế tất cả các ký tự old bằng ký tự new trong một chuỗi nào đó', true),
(27, 7,'Thay thế ký tự old đầu tiên bằng ký tự new trong một chuỗi nào đó', false),
(28, 7,'Thay thế ký tự old cuối cùng bằng ký tự new trong một chuỗi nào đó', false),
(29, 8,'Một Client chỉ phục vụ yêu cầu của một Server', false),
(30, 8,'Một Server phục vụ yêu cầu của nhiều Client', true),
(31, 8,'Một Server chỉ phục vụ yêu cầu của một Client', false),
(32, 8,'Một Client phục vụ yêu cầu của nhiều Server', false),
(33, 9,'Máy ảo JVM được nhiều nền tảng hỗ trợ', true),
(34, 9,'Trình biên dịch được xác định bởi trình biên dịch của C++', false),
(35, 9,'Lập trình Java đ¬ợc kế thừa từ C++', false),
(36, 9,'Hàm API thực hiện các thao tác', false),
(37, 10,'Trả về tên của file trong một chuỗi địa chỉ URL', false),
(38, 10,'Trả về tên của máy chủ trong một chuỗi địa chỉ URL', false),
(39, 10,'Trả về số hiệu cổng sử dụng trong một chuỗi đĩa chỉ URL', true),
(40, 10,'Trả về tên của giao thức trong một chuỗi địa chỉ URL', false),
(41, 11,'Một Client phục vụ yêu cầu của nhiều Server', false),
(42, 11,'Một Server phục vụ yêu cầu của nhiều Client', true),
(43, 11,'Một Server chỉ phục vụ yêu cầu của một Client', false),
(44, 11,'Một Client chỉ phục vụ yêu cầu của một Server', false),
(45, 12,'Hàm API thực hiện các thao tác', false),
(46, 12,'Trình biên dịch được xác định bởi trình biên dịch của C++', false),
(47, 12,'Lập trình Java được kế thừa từ C++', false),
(48, 12,'Máy ảo JVM được nhiều nền tảng hỗ trợ', true),
(49, 13,'Trả về số hiệu cổng sử dụng trong một chuỗi đĩa chỉ URL', true),
(50, 13,'Trả về tên của giao thức trong một chuỗi địa chỉ URL', false),
(51, 13,'Trả về tên của máy chủ trong một chuỗi địa chỉ URL', false),
(52, 13,'Trả về tên của file trong một chuỗi địa chỉ URL', false),
(53, 14,'Trả về nội dụng dữ liệu thật sự chứa trong gói dữ liệu', true),
(54, 14,'Trả về địa chỉ chứa trong gói dữ liệu', false),
(55, 14,'Trả về kích thước của gói chứa trong gói dữ liệu', false),
(56, 14,'Trả về số hiệu cổng chứa trong gói dữ liệu', false),
(57, 15,'java.string', false),
(58, 15,'javax.util', false),
(59, 15,'java.util', false),
(60, 15,'java.lang', true),
(61, 16,'Trả về số hiệu cổng chứa trong gói dữ liệu', true),
(62, 16,'Trả về nội dụng dữ liệu thật sự chứa trong gói dữ liệu', false),
(63, 16,'Trả về địa chỉ chứa trong gói dữ liệu', false),
(64, 16,'Trả về kích thước của gói chứa trong gói dữ liệu', false),
(65, 17,'Số cổng', false),
(66, 17,'Chiều dài gói', false),
(67, 17,'Địa chỉ IP', true),
(68, 17,'Dữ liệu', false),
(69, 18,'Chiều dài gói', false),
(70, 18,'Địa chỉ IP', false),
(71, 18,'Dữ liệu', true),
(72, 18,'Số cổng', false),
(73, 19,'Địa chỉ IP', false),
(74, 19,'Dữ liệu', false),
(75, 19,'Chiều dài gói', true),
(76, 19,'Số cổng', false),
(77, 20,'Địa chỉ IP', false),
(78, 20,'Chiều dài gói', false),
(79, 20,'Dữ liệu', false),
(80, 20,'Số cổng', true),
(81, 21,'private float MyMethd(float z, int i){z=10;return z;}', false),
(82, 21,'static void My(float x){x=5;return x}', false),
(83, 21,'protected float MyMethd(float r, String s){r=10;return r;}', false),
(84, 21,'final float MyMethd(float y){}', true),
(85, 22,'Port D.', true),
(86, 22,'Địa chỉ IP', false),
(87, 22,'Tên miền', false),
(88, 22,'Tất cả đều sai', false),
(89, 23,'int', false),
(90, 23,'String', false),
(91, 23,'float', false),
(92, 23,'byte', true),
(93, 24,'Dữ liệu (data) và chiều dài gói (length)', false),
(94, 24,'Địa chỉ IP (address) và số cổng (port)', false),
(95, 24,'Cả hai phương án trên đều đúng', true),
(96, 24,'Cả hai phương án trên đều sai', false),
(97, 25,'Gửi một ký tự v tới nguồn xuất bất kỳ', false),
(98, 25,'Gửi một chuỗi ký tự v tới nguồn xuất bất kỳ', true),
(99, 25,'Gửi một số thực v tới nguồn xuất bất kỳ', false),
(100, 25,'Gửi một số nguyên v tới nguồn xuất bất kỳ', false),
(101, 26,'Lấy địa chỉ của máy chủ được kết nối đến dưới dạng kiểu InetAddress', false),
(102, 26,'Lấy về luồng nhập để máy khách có thể đọc dữ liệu gửi trả về từ phía máy chủ', false),
(103, 26,'Lấy về số cổng được kết nối đến máy chủ', true),
(104, 26,'Lấy về luồng xuất để máy khách có thể gửi dữ liệu đến máy chủ', false),
(105, 27,'Mở kết nối từ máy khách đến máy chủ', false),
(106, 27,'Mở kết nối từ máy khách đến máy chủ và mở kết nối từ phía máy chủ đến máy khách', false),
(107, 27,'Mở kết nối từ phía máy chủ chờ máy khách kết nối đến thông qua cổng port, cho phép số máy kết nối cùng lúc là count', true),
(108, 27,'Mở kết nối từ phía máy chủ chờ máy khách kết nối đến thông qua số hiệu cổng port', false),
(109, 28,'Máy chủ và máy khách', true),
(110, 28,'Không phải máy chủ và máy khách', false),
(111, 28,'Máy khách', false),
(112, 28,'Máy chủ', false),
(113, 29,'Gửi một chuỗi ký tự v tới nguồn xuất bất kỳ', false),
(114, 29,'Gửi một ký tự v tới nguồn xuất bất kỳ', false),
(115, 29,'Gửi một số thực v tới nguồn xuất bất kỳ', false),
(116, 29,'Gửi một số nguyên v tới nguồn xuất bất kỳ', true),
(117, 30,'[ ]', true),
(118, 30,'" "', false),
(119, 30,'{ }', false),
(120, 30,'()', false),
(121, 31,'String', false),
(122, 31,'int[]', false),
(123, 31,'int', true),
(124, 31,'Float', false),
(125, 32,'Presentation', false),
(126, 32,'Transport', false),
(127, 32,'Session', false),
(128, 32,'Application', true),
(129, 33,'Data Link', false),
(130, 33,'Physical', true),
(131, 33,'Network', false),
(132, 33,'Transport', false),
(133, 34,'Dùng giao thức FTP', false),
(134, 34,'Dùng giao thức HTTP', false),
(135, 34,'Dùng giao thức DHCP', true),
(136, 34,'Dùng giao thức DNS', false),
(137, 35,'Một trong những thành phần không thể thiếu trong hệ thống mạng', false),
(138, 35,'Là các qui tắc để cho phép các máy tính có thể giao tiếp được với nhau', false),
(139, 35,'A và B đúng', true),
(140, 35,'A và B sai', false),
(141, 36,'Là mô hình nhiều máy khách giao tiếp với nhau theo 1 hoặc nhiều dịch vụ', false),
(142, 36,'Là mô hình nhiều máy tớ giao tiếp với nhau theo 1 hoặc nhiều dịch vụ', false),
(143, 36,'Là mô hình nhiều máy con giao tiếp với nhau theo 1 hoặc nhiều dịch vụ', false),
(144, 36,'Là mô hình mạng trên đó có các máy chủ và máy tớ giao tiếp với nhau theo 1 hoặc nhiều dịch vụ', true),
(145, 37,'Sun Solaris OS', false),
(146, 37,'Microsoft Windows', false),
(147, 37,'Linux', false),
(148, 37,'Tất cả các đáp án đều đúng.', true),
(149, 38,'Nếu CONDITION đúng thì thực hiện Khối lệnh, nếu sai thì bỏ qua', true),
(150, 38,'Nếu CONDITION sai thì thực hiện Khối lệnh, nếu đúng thì bỏ qua', false),
(151, 38,'Không có đáp án đúng', false),
(152, 38,'	Tất cả đều sai.', false),
(153, 39,'(-32,768) đến 32,767', false),
(154, 39,'0 đến 65535', false),
(155, 39,'(-256) đến 255', false),
(156, 39,'(-128) đến 127 +', true),
(157, 40,'Lấy ký tự có số chỉ mục n trong chuỗi k', true),
(158, 40,'Lấy ký tự bất kỳ trong chuỗi str', false),
(159, 40,'Lấy độ dài chuỗi str', false),
(160, 40,'Không có lệnh này', false),
(161, 41,'Nếu condition là true thì result = value2, nếu condition là false thì result = value1', false),
(162, 41,'Nếu condition là true thì result = value1, nếu condition là false thì result = value2', true),
(163, 41,'Không có lệnh này', false),
(164, 41,'Nếu condition là true thì result sẽ đảo giá trị của value1 và value2', false),
(165, 42,'string1 = string2', false),
(166, 42,'string1== string2', false),
(167, 42,'string1.equal(string2)', false),
(168, 42,'string1.equals(string2)', true),
(169, 43,'Để tham chiếu tới các lớp mà không cần tiền tố', true),
(170, 43,'Để tránh thực hiện lời gọi tới các phương thức', false),
(171, 43,'Để gọi tới các ảnh mà bạn muốn sử dụng', false),
(172, 43,'Để tránh khỏi phải khai báo biến', false),
(173, 44, '	Biên dịch thành công và đưa màn hình kết quả "In first main()" khi chạy với đối số của a', true),
(174, 44, '	Biên dịch thành công và đưa ra màn hình kết quả "a" khi chạy với đối số của a', false),
(175, 44, '	Biên dịch thành công nhưng sẽ đưa ra lỗi xảy ra ngoại lệ khi chạy', false),
(176, 45,'Là đối tượng được khai báo để hoạt động trong chương trình.', false),
(177, 45,'Là bản thiết kế từ đó tạo ra các đối tượng', true),
(178, 45,'Là một chức năng trong java dùng để chứa đối tượng.', false),
(179, 45,'Tất cả đều sai.', false),
(180, 46,'class Xedap1 extends Xedap {}', true),
(181, 46,'public classs Xedap1 extend Xedap {}', false),
(182, 46,'class Xedap1 extend Xedap {}', false),
(183, 46,'Tất cả đều sai', false),
(184, 47,'_final', false),
(185, 47,'dem', false),
(186, 47,'final', true),
(187, 47,'$final', false),
(188, 48,'Kiểm tra xem từ đó đã có trong dữ liệu vào chưa', true),
(189, 48,'Di chuyển đến từ tiếp theo', false),
(190, 48,'Cả A, B đều đúng', false),
(191, 48,'Cả A, B đều sai', false),
(192, 49,'Cho phép ta đọc', false),
(193, 49,'Cho phép ta nhập vào 1 ký tự', false),
(194, 49,'Cho phép ta nhập vào 1 ký tự hay một chuỗi nào đó vào từ bàn phím', true),
(195, 49,'Cả A,B, C đều đúng', false),
(196, 50,'Đọc 1 giá trị số nguyên từ bàn phím', true),
(197, 50,'Đọc 1 chuỗi ký tự từ bàn phìm, kể cả dấu cách', false),
(198, 50,'Đọc 1 giá trị số thực từ bàn phím', false),
(199, 50,'Đọc 1 chuỗi ký tự từ bàn phím, không kể dấu cách', false),
(200, 44, 'Biên dịch không thành công', false);

























