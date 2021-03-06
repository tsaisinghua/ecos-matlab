c_ = sparse(58,1);
c_(1) = 1;
b_ = sparse(48,1);
b_(7:9) = d;
b_(16:16) = e;
b_(17:17) = -0.5;
b_(18:18) = -0.5;
b_(39:48) = b;
A_ = sparse(48, 58);
A_(1:3, 31:33) = 1.0*speye(3, 3); A_(1:3, 34:36) = -1.0*speye(3, 3);
A_(4:6, 13:17) = C; A_(4:6, 31:33) = -1.0*speye(3, 3);
A_(7:9, 34:36) = 1.0*speye(3, 3);
A_(10:10, 37:37) = 1.0; A_(10:10, 2:2) = 1.0; A_(10:10, 38:38) = -1.0;
A_(11:15, 37:37) = 1.0*ones(5, 1); A_(11:15, 8:12) = -1.0*speye(5, 5); A_(11:15, 3:7) = -1.0*speye(5, 5);
A_(16:16, 38:38) = 1.0;
A_(17:17, 1:1) = 0.5; A_(17:17, 18:18) = -1.0;
A_(18:18, 1:1) = -0.5; A_(18:18, 19:19) = -1.0;
A_(19:28, 39:48) = 1.0*speye(10, 10); A_(19:28, 49:58) = -1.0*speye(10, 10); A_(19:28, 21:30) = -1.0*speye(10, 10);
A_(29:38, 13:17) = A; A_(29:38, 39:48) = -1.0*speye(10, 10);
A_(39:48, 49:58) = 1.0*speye(10, 10);
cvx_solver mosek
cvx_begin
variable x_codegen(58)
minimize (c_'*x_codegen)
A_*x_codegen == b_
x_codegen(2:2) >= 0
x_codegen(3:7) >= 0
norms([x_codegen(13:17)],[],2) <= x_codegen(8:12)
norms([x_codegen(19:19), x_codegen(20:20)],[],2) <= x_codegen(18:18)
norm([x_codegen(21:30)]) <= x_codegen(20:20)
cvx_end
t3 = x_codegen(1:1);
t7 = x_codegen(2:2);
t6z0 = x_codegen(3:7);
t6s0 = x_codegen(8:12);
x = x_codegen(13:17);
t3z0 = x_codegen(18:18);
t3z1 = x_codegen(19:19);
t2 = x_codegen(20:20);
t1 = x_codegen(21:30);
t4 = x_codegen(31:33);
pd = x_codegen(34:36);
t6 = x_codegen(37:37);
pe = x_codegen(38:38);
t0 = x_codegen(39:48);
pb = x_codegen(49:58);
ecos_optval = 1*cvx_optval;
