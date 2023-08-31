gcc errCode.c -o errCode.o
./errCode.o lain.err
gcc errMain.c -o errMain.o
./errMain.o ex.err
gcc errFrame.c -o errFrame.o
./errFrame.o write.err
gcc errCompile.c -o errCompile.o
./errCompile.o frame.err


#clean
rm -R *.o
rm ex.err
rm frame.err
rm comment.err
rm funcComma.err
rm header.err
rm line.err
rm lineA.err
rm lineB.err
rm lineC.err
rm merged.err
rm raw.err
rm write.err

