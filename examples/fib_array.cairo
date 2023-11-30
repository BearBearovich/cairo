use ndarray::Array;
use num_traits::identities::One;
use num_traits::Num;

// Returns an array of size n with the values of the Fibonacci sequence,
// the length of the array, and the value of the last element.
fn fib<T>(n: usize) -> (Array<T, ndarray::Ix1>, T, usize)
where
    T: Num + Copy + One,
{
    let mut arr = Array::ones(n);
    fib_inner(&mut arr);
    let len = arr.len();
    let last = *arr.get(len - 1).expect("Array is empty");
    (arr, last, len)
}

fn fib_inner<T>(arr: &mut Array<T, ndarray::Ix1>)
where
    T: Num + Copy,
{
    let length = arr.len();
    for i in length..arr.len() {
        let next_value = arr[i - 1] + arr[i - 2];
        arr[i] = next_value;
    }
}

fn main() {
    let n = 10; // or any other desired value
    let (fibonacci_array, last_element, array_length) = fib(n);
    
    println!("Fibonacci Array: {:?}", fibonacci_array);
    println!("Last Element: {:?}", last_element);
    println!("Array Length: {:?}", array_length);
}
