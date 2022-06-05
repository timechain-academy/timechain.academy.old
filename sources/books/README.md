Books
--

## [Tiny Python Projects, by Ken Youens-Clar](https://github.com/jathinreddy/kyclark_tiny_python_projects/blob/master/README.md)

* [Chapter 1: How to write and test a Python program](https://www.youtube.com/playlist?list=PLhOuww6rJJNP7UvTeF6_tQ1xcubAs9hvO): How to create a Python program, understanding comments and the shebang, how to make a program executable and install into your $PATH, how to write a main() function, add docstrings, format your code, and run tests.

* [Chapter 2: Crow's Nest](https://www.youtube.com/playlist?list=PLhOuww6rJJNPBqIwfD-0RedqsitBliLhT): How to write a Python program that accepts a single, positional argument and creates a newly formatted output string.

* [Chapter 3: Picnic](https://www.youtube.com/playlist?list=PLhOuww6rJJNMuQohHrNxRjhFTR9UlUOIa): Writing a Python program that accepts multiple string arguments and formats the results depending on the number of items.

* [Chapter 4: Jump The Five](https://www.youtube.com/playlist?list=PLhOuww6rJJNNd1Mbu3h6SGfhD-8rRxLTp): Writing a Python program to encode the numerals in a given text using an algorithm called "Jump The Five." Use of a dictionary as a lookup table, characters not in the dictionary remain unchanged. Introduction to encoding/decoding text, basic idea of encryption.

* [Chapter 5: Howler](https://www.youtube.com/playlist?list=PLhOuww6rJJNNzo5zqtx0388myQkUKyrQz): Writing a Python program that can process input text either from the command line or from a file.The output prints either to STDOUT or to a file.  Learning about "os.path.isfile", how to "open" a file handle for reading/writing, how to read/write the contents of a file.

* [Chapter 6: Word Count](https://www.youtube.com/playlist?list=PLhOuww6rJJNOGPw5Mu5FyhnumZjb9F6kk): Writing a Python program to emulate the `wc` (word count) program. Validates and processes multiple file inputs as well as STDIN and creates output of the counts of lines, words, and bytes for each file optionally with a "total" if more than one file is provided.

* [Chapter 7: Gashlycrumb](https://www.youtube.com/playlist?list=PLhOuww6rJJNMxWy34-9jlD2ulZxaA7mxV): Writing a Python program that processes an input file to build a lookup table (dictionary) that is used with multiple positional arguments to translate to the values from the file.

* [Chapter 8: Apples and Bananas](https://www.youtube.com/playlist?list=PLhOuww6rJJNMe_qrKzw6jtxzHkTOszozs): Writing a Python program to find and replace elements in a string. Exploring multiple ways to write the same idea from for loops to list comprehensions to higher-order functions like map().

* [Chapter 9: Abuse](https://www.youtube.com/playlist?list=PLhOuww6rJJNOWShq53st6NjXacHHaJurn): Writing a Python program to generate Shakespearean insults by randomly combining some number of adjectives with a randomly chosen noun. Learning about randomness, seeds, testing, how to use triple-quoted strings.

* [Chapter 10: Telephone](https://www.youtube.com/playlist?list=PLhOuww6rJJNN0T5ZKUFuEDo3ykOs1zxPU): Using probabalistic and deterministc approaches to randomly mutating a string.

* [Chapter 11: Bottles of Beer](https://www.youtube.com/playlist?list=PLhOuww6rJJNNGDXdGGfp3RDXBMhJwj0Ij): Writing a Python program to produce the verse to the "99 Bottles of Beer" song from a given starting point. Learning to count down, format strings, algorithm design. A focus on writing a function and unit test, exploring ways to incorporate our function to generate the verses from for loops to list comprehensions to map().

* [Chapter 12: Ransom](https://www.youtube.com/playlist?list=PLhOuww6rJJNMxWhckg7FO4cEx57WgHbd_): Writing a Python program that will randomly capitalize letters in a given piece of text for the nefarious purpose of creating a ransom note. Exploration of for loops, list comprehensions, and the map() function.

* [Chapter 13: Twelve Days of Christmas](https://www.youtube.com/playlist?list=PLhOuww6rJJNNZEMX12PE1OvSKy02UQoB4): Writing a Python program to create the verses for "The Twelve Days of Christmas" from a given day. Learning how to write a function and the test for it, then using the function in a list comprehension and a map to generate the output.

* [Chapter 14: The Rhymer](https://www.youtube.com/playlist?list=PLhOuww6rJJNPNn2qa5ATHJ0qd-JUgM_s0): Writing a Python program that can split off any initial consonants from a word and append a list of prefixes to create new rhyming "words." Exploration of regular expressions to handle words with no initial consonants, with one or more leading consonants, and nothing but consonants. Writing a `stemmer()` function and the `test_stemmer()` function to understand it. Using list comprehensions with guard statements and how that relates to the `filter()` function.

* [Chapter 15: The Kentucky Friar](https://www.youtube.com/playlist?list=PLhOuww6rJJNMflxi3aRAQTqG7mvOXRObW): In this chapter we delve further into regular expressions, first learning how to split a string using a regex so we can separate things that look like "words" from non-words like punctuation and whitespace. Then we try to identify the word "you" (case-insensitive) to turn into "y'all" and any 2-syllable words ending in "-ing" so we can replace the final "g" with an apostrophe so that "cooking" becomes "cookin'" but "swing" would remain "swing." We then apply this to an entire body of text to Kentucky fry the words with amusing results.

* [Chapter 16: The Scrambler](https://www.youtube.com/playlist?list=PLhOuww6rJJNPcLby3JXlKSo6duCIjh93S): Writing a Python program to find each "word" in a body of text and then scramble the letters such that the first and last letters remain in place, then reconstructing the text for output. Using regular expressions to split text, using `random.shuffle()` and understanding in-place mutation vs returning a new value. Comparing `for` loops to list comprehensions and the "map()" function.

* [Chapter 17: Mad Libs](https://www.youtube.com/playlist?list=PLhOuww6rJJNPnNx_Emds00y2RX1Tbk59r): Writing a Python program to play the classic Mad Libs game. Reading an input file with placeholders for parts of speech like "adjective" or "noun." Getting the inputs to replace those from the user interactively via the "input()" function or taking them from the command-line arguments. Using regular expressions to find and replace the placeholders. Learning about greedy regex and how to make them not greedy. Using the `re.findall()` and `re.sub()` functions. Using `sys.exit()` to prematurely exit a program with an error message/value.


---

## [Mastering Bitcoin](https://github.com/bitcoinbook/bitcoinbook/blob/develop/README.md) - Second Edition

The tags, [second_edition_print_1](https://github.com/bitcoinbook/bitcoinbook/releases/tag/second_edition_print_1) and  [second_edition_print2](https://github.com/bitcoinbook/bitcoinbook/releases/tag/second_edition_print2), correspond to the first (June 8th, 2017) and second (July 20th, 2017) print of Mastering Bitcoin (Second Edition), as published by O'Reilly Media.

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" property="dct:title" rel="dct:type">Mastering Bitcoin - Second Edition</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://antonopoulos.com/" property="cc:attributionName" rel="cc:attributionURL">Andreas M. Antonopoulos LLC</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

---

## [Mastering Lightning](https://github.com/lnbook/lnbook/blob/develop/README.md)

Mastering the Lightning Network is released under the Creative Commons CC-BY-NC-ND license, which allows sharing the source code for personal use only. You may read this book for free. You may not create derivatives (such as PDF copies), or distribute the book commercially. The full terms of the license can be found here:

[![Creative Commons License](https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Mastering the Lightning Network</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://lnbook.info/" property="cc:attributionName" rel="cc:attributionURL">Andreas M. Antonopoulos, Olaoluwa Osuntokun, Rene Pickhardt</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.

