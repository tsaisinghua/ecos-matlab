c_ = sparse(27,1);
c_(1) = 1;
b_ = sparse(19,1);
b_(4:4) = l;
b_(8:8) = u;
b_(10:10) = -0.5;
b_(11:11) = -0.5;
b_(16:17) = b;
A_ = sparse(19, 27);
A_(1:3, 19:19) = 1.0*ones(3, 1); A_(1:3, 2:4) = 1.0*speye(3, 3); A_(1:3, 16:18) = -1.0*speye(3, 3);
A_(4:4, 19:19) = 1.0;
A_(5:7, 16:18) = 1.0*speye(3, 3); A_(5:7, 5:7) = 1.0*speye(3, 3); A_(5:7, 20:20) = -1.0*ones(3, 1);
A_(8:8, 20:20) = 1.0;
A_(9:9, 21:21) = 1.0; A_(9:9, 22:22) = 1.0; A_(9:9, 1:1) = -1.0;
A_(10:10, 21:21) = 0.5; A_(10:10, 8:8) = -1.0;
A_(11:11, 21:21) = -0.5; A_(11:11, 9:9) = -1.0;
A_(12:13, 23:24) = 1.0*speye(2, 2); A_(12:13, 25:26) = -1.0*speye(2, 2); A_(12:13, 11:12) = -1.0*speye(2, 2);
A_(14:15, 16:18) = A; A_(14:15, 23:24) = -1.0*speye(2, 2);
A_(16:17, 25:26) = 1.0*speye(2, 2);
A_(18:18, 27:27) = lambda; A_(18:18, 22:22) = -1.0;
A_(19:19, 27:27) = -1.0; A_(19:19, 13:15) = 1.0*ones(1, 3);
G_ = sparse(18, 27);
G_(1:1:3, 2:4) = -speye(3, 3);
G_(4:1:6, 5:7) = -speye(3, 3);
G_(7:2:12, 13:15) = -speye(3, 3);
G_(8:2:13, 16:18) = -speye(3, 3);
G_(13:1:13, 8:8) = -speye(1, 1);
G_(14:1:14, 9:9) = -speye(1, 1);
G_(15:1:15, 10:10) = -speye(1, 1);
G_(16:1:16, 10:10) = -speye(1, 1);
G_(17:1:18, 11:12) = -speye(2, 2);
h_ = zeros(18, 1);
dims.q = [2,2,2,3,3];
dims.l = 6;
[x_codegen, y_, info_] = ecos(full(c_), G_, h_, dims, A_, full(b_));
t4 = x_codegen(1:1);
t7 = x_codegen(2:4);
t8 = x_codegen(5:7);
t3z0 = x_codegen(8:8);
t3z1 = x_codegen(9:9);
t2 = x_codegen(10:10);
t1 = x_codegen(11:12);
t6s0 = x_codegen(13:15);
x = x_codegen(16:18);
pl = x_codegen(19:19);
pu = x_codegen(20:20);
t3 = x_codegen(21:21);
t5 = x_codegen(22:22);
t0 = x_codegen(23:24);
pb = x_codegen(25:26);
t6 = x_codegen(27:27);
ecos_optval = 1*info_.pcost;
