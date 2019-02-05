float MinR = 2; // didinant slenka desinen
float MaxR = 0.8; // didinant slenka kairen
float MinI = 1.2; // spaudzia i apacia
float MaxI = 1.2; // spaudzia i virsu
int iterations = 5000;

void setup() {
    //size(800,600);
    fullScreen();
    background(0);
}


void draw() {
  loadPixels();
      for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {

          float a = map(x,0,width,-MinR,MaxR);
          float b = map(y,0,height,-MinI,MaxI);

            int n = 0;
            float ca = a;
            float cb = b;

            while(n < iterations)
            {        
              // so u pretty much need to do the mandelbrot set formula for two axis
                // a^2 - b^2
                float aa = CalculateReal(a,b);
                // 2*a*b
                float bb = CalculateImg(a,b);
                
                // like z^2 + c for x axis 
                a = aa + ca;
                // like z^2 + c for y axis 
                b = bb + cb;;               
               if(abs(a + b) > 2){ break;}
               n++;
            }
                 int pix = (x + y * width); // find pixel (x,y)
                 pixels[pix] = color((sin(n)) % 256, (n)%256, (n*n)%256);
        }
    }

  updatePixels();
    noLoop();
}

float CalculateReal(float sum1, float sum2){
    return sum1*sum1 - sum2*sum2;
}
float CalculateImg(float sum1, float sum2){
    return 2*sum1*sum2;
}
