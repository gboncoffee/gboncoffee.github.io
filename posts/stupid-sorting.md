<!-- Stupid Sorting :: 2023-09-12 10:02:53 -->

# Stupid Sorting

The first topic in "Algoritmos e Estruturas de Dados II" ("Algorithms and Data
Structures II") classes are sorting algorithms. The first one we learn is the
stupid Selection Sort. It's not really that usefull but it's a great example to
learn. Then we learn stuff like the Insertion Sort, which's actually usefull and
more complex to understand.

But, as stupid as Selection Sort is, it's kinda straightforward. What about some
really, really stupid and useless sorting algorithms?

For this algorithms I used some `#includes` and a simple function that checks if
an array is sorted. The entire source is available
[here at GitHub](https://gist.github.com/gboncoffee/2ecfacb0bc7f03626e4c1d2e4d00253f).

## Kill Sort

Sorts the array by removing unsorted itens. Returns the final size.

```c
int kill_sort(int *v, int n)
{
	int pad = 0;
	for (int i = 1; i < n; i++) {
		if (v[i] < v[i - 1 - pad])
			pad++;
		else
			v[i - pad] = v[i];
	}

	return n - pad;
}
```

The cool thing about this one is that it keeps the pointer valid. Of course,
it's usefull if we want a sorted array but don't need all the elements. It's
linear too, which is very cheap, but it writes a lot, and that's not great if
writes are expensive.

## Thanos Sort

Sorts the array by removing a random half of it until it's sorted. Returns the
final array pointer and sets n to it's size.

```c
int* thanos_sort(int *v, int *n)
{
	srand(time(NULL));
	while (*n > 1 && !sorted(v, *n)) {
		if (random() % 2) {
			v += *n / 2;
		}

		*n = *n / 2;
	}

	return v;
}
```

Very similar to Kill Sort. Unfortunatelly, this one leads to much more data loss
and does not have predictable behaviour. But it does not make a single write in
the array and runs in logarithmic time. Extremelly cheap. Also, it may not keep
the pointer valid, and that's why it returns a new one. This should be used with
caution to not cause memory leaks.

## Random Sort

Sorts the array by randomizing a sequence and them checking if it's sorted.

```c
void random_sort(int *v, int n)
{
	int x, y, tmp;
	srand(time(NULL));
	while (!sorted(v, n)) {
		for (int i = 0; i < n; i++) {
			x = random() % n;
			y = random() % n;
			tmp = v[x];
			v[x] = v[y];
			v[y] = tmp;
		}
	}
}
```

This one is fun. It has a little chance of sorting the array in a single
iteration. I tested with an array with 10 elements and it usuallys takes between
300 thousand and 700 thousand iterations to finish. As it have a chance of
running a single iteration, it have a chance of never sorting at all too.

## Intelligent Design Sort

Sorts the array by the following principle:  
- There's n! chance of the array being sorted;  
- So it must have been sorted by an intelligent designer.

```c
void intelligent_design_sort(int *v, int n)
{
	(void) v;
	(void) n;
}
```

This is the cheapest algorithm here. Runs in constant time and uses only a
single stack frame of memory *at all, without compiler optimization*. I've only
ever saw very few functions cheapest than this in computer science, and they're
usually not usefull at all.

## Miracle Sort

Sorts the array by waiting and hoping cosmic rays are going to flip the memory
so the array get's sorted.

```c
void miracle_sort(int *v, int n)
{
	while (!sorted(v, n))
		sleep(5);
}
```

Yeah it just sits there and patiently waits for a miracle. You can adjust the
sleep time to change the behaviour of the algorithm: more time will lead to a
slightly slower sort, but less CPU usage. Less time will lead to a slightly
faster sort, but more CPU usage.

## Schrodinger Sort

It's not sorted nor unsorted until you check it.

```c
int schrodinger_sort(int *v, int n)
{
	return sorted(v, n);
}
```

It sorts the array by telling you if it's sorted or not, so you decides what to
do. Quantum mechanics are really cool, aren't they?
