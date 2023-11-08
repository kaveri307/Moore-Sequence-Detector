module Mooreno_1011 (w,z,Clock, resetn);
input Clock, resetn, w;
output reg z;
reg [2:0] y, Y;
parameter A=3'b000, B=3'b001, C=3'b011, D=3'b010, E=3'b110;

always@(posedge Clock, negedge resetn)
begin
if(resetn==0)
  y<=A;
  else
  y<=Y;
 end 

always @(w, y)
begin
case (y)
A: if (w) Y=B;
else Y=A;
B: if (w) Y=B;
else Y=C;
C: if (w) Y=D;
else Y=A;
D: if (w) Y=E;
else Y=C;
E: if (w) Y=B;
else Y=A;
default:Y=3'bxxx;
endcase
end

always@(y)
 begin
 case(y)
A:z<=0;
B:z<=0;
C:z<=0;
D:z<=0;
E:z<=1;
default:z<=0;
endcase
end

endmodule
