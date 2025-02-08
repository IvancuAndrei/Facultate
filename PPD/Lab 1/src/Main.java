import java.util.Arrays;
import java.util.Random;

public class Main {

    public static class newThread extends Thread{
        private int id, p, n;
        private int [] A, B, C;

        public newThread(int id, int p, int n, int [] A, int [] B, int [] C){
            this.id = id;
            this.p = p;
            this.n = n;
            this.A = A;
            this.B = B;
            this.C = C;
        }

        public void run(){
            for(int i=id; i<n; i+=p){
                C[i] = A[i] + B[i];
            }
        }
    }

    public static class sequentialThread extends Thread{
        private int i, j;
        private int [] A, B, C;

        public sequentialThread(int i, int j, int [] A, int [] B, int [] C){
            this.i = i;
            this.j = j;
            this.A = A;
            this.B = B;
            this.C = C;
        }

        public void run(){
            for(int k = i; k < j; k++){
                C[k] = A[k] + B[k];
            }
        }
    }


    public static int[] generator (int n, int max){
        int [] vector = new int[n];

        Random rand = new Random();

        for(int i=0; i<n; i++){
            vector[i] = rand.nextInt(max);
        }

        return vector;
    }

    public static void main(String[] args) {
        int n = 1000000;
        int max = 50000;

        int [] A = generator(n, max);
        int [] B = generator(n, max);
        int [] C = generator(n, max);
        long start = System.currentTimeMillis();
        for(int i=0; i<n; i++){
            C[i] = A[i] + B[i];
        }
        long end = System.currentTimeMillis();
        System.out.print("C: ");
        System.out.println(end - start);

        int [] C2 = new int[n];
        int p = 1000;
        newThread [] threads = new newThread[p];
        long startThread = System.currentTimeMillis();
        for(int i=0; i<p; i++){
            newThread thread = new newThread(i, p, n, A, B, C2);
            threads[i] = thread;
            thread.start();
        }

        for(int i = 0; i<p; i++){
            try{
                threads[i].join();
            }catch (Exception e){
                System.out.println(e);
            }
        }

        long endThread = System.currentTimeMillis();
        System.out.print("C2: ");
        System.out.println(endThread - startThread);

        int [] C3 = new int[n];
        sequentialThread[] sequentialThreads = new sequentialThread[p];

        long startSeq = System.currentTimeMillis();

        for(int i=0; i < p - 1; i++){
            sequentialThread seqThread = new sequentialThread(i * n / p , (i + 1)* n / p, A, B, C3);
            sequentialThreads[i] = seqThread;
            seqThread.start();
        }

        sequentialThread seqThread2 = new sequentialThread((p - 1) * n / p, n, A, B, C3);
        sequentialThreads[p - 1] = seqThread2;
        seqThread2.start();


        for (int i = 0; i < p; i++) {
            try {
                sequentialThreads[i].join();
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        long endSeq = System.currentTimeMillis();
        System.out.print("C3: ");
        System.out.println(endSeq - startSeq);
    }
}