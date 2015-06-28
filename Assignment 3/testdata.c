#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/* CSC 225 Assignment Test Data Generator
 * Author: Keegan van der Laag (jkvander@uvic.ca)
 *
 * Description:
 * Generates random, garbage integers between 0 and
 * 1,000,000 to feed your CSC 225 assignments.
 * Writes output to a text file if a filename is given,
 * and to stdout if not.
 *
 * (stdout is formatted in the expected input format of
 *  Heap.java, separated by newlines, with a terminating
 *  -1)
 *
 * Usage:
 *   testdata [n] [filename]
 *
 * Example:
 *   testdata 1000 test1000.txt
 *
 *     - Writes 1000 random values to test1000.txt
 *
 *
 * This software is licensed under the Crowley Public License.
 * "Do what thou wilt shall be the whole of the law."
 *
 */

int main(int argc, char* argv[]) {

    FILE *outfile;
    char* outputname;

    fprintf(stderr, "\nCSC 225 Test Data Generator\nAuthor: Keegan van der Laag (jkvander@uvic.ca)\n");

    if (argc < 2) {
        fprintf(stderr, "\nError: Requires at least one argument", argc -1);
        fprintf(stderr, "\nUsage: testdata [n] <filename>\nn: number of items to generate, range: 1 - 1,000,000.\nfilename: (Optional) name of output file.\n");
        exit(-1);
    }

    if (argc > 3) {
        fprintf(stderr, "\nExtra arguments ignored.\n");
    }

    int number = atoi(argv[1]);

    if (number < 1 || number > 1000000) {
        fprintf(stderr, "\nError: Number of items to generate must be between 1 and 1,000,000. (%d given)\n", number);
        fprintf(stderr, "\nUsage: testdata [n] [filename]\nn: number of items to generate, range: 1 - 1,000,000.\nfilename: name of output file.\n");
        exit(-1);
    }

    if (argc == 3) {
        outputname = argv[2];
        outfile = fopen(outputname, "w");

        if (outfile == NULL) {
            fprintf(stderr, "\nError: Could not open file %s for writing.\n", outputname);
            fprintf(stderr, "\nUsage: testdata [n] [filename]\nn: number of items to generate, range: 1 - 1,000,000.\nfilename: name of output file.\n");
            exit(-1);
        }
    } else {
        outfile = stdout;
    }

    srand(time(NULL));

    int randhigh, randlow;
    long int x;
    int big;

    for (int i = 0; i < number; i++) {
        big = rand()%2;
        randlow = rand();
        if (big) {
            randhigh = rand();
            x = ((randhigh<<16) + randlow)%1000000;
        } else {
            x = (randlow);//%1000000;
        }

        if (argc == 2) {
            fprintf(outfile, "%d\n", x);
        } else {
            fprintf(outfile, "%d", x);
            if (i + 1 < number)
                fprintf(outfile, " ");
        }
    }

    if (argc == 2) {
        fprintf(outfile, "%d\n", -1);
    } else {
        fprintf(stderr, "\nSuccessfully output %d numbers to file %s\n\n", number, outputname);
        fclose(outfile);
    }

    return 0;
}
