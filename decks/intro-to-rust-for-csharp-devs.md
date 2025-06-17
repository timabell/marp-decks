---
theme: gaia
paginate: true
marp: true
class:
    - lead
---

## A quick intro to Rust 🦀 for C# devs
[Dotnet Oxford Lightning talks 17 June 2025](https://www.meetup.com/dotnetoxford/events/307454172/)
Tim Abell [0x5.uk](https://0x5.uk/)
```rust
// hello.rs
fn main() {
    println!("Hello dotnet oxford!");
}
```

<!--
speaker notes here
-->

---
<!--
footer: Tim Abell | 0x5.uk
-->


### The hunt for the perfect language

C# 💼 💷
~~Ruby on Rails~~  ([GDS](https://www.gov.uk/government/organisations/government-digital-service))
~~GoLang~~ ([Schema Explorer](https://timabell.github.io/schema-explorer/))
Rust! ([gitopolis](https://github.com/rustworkshop/gitopolis))

---

- ##  🥷 Rust vs. C# 🥊
	- ### Performance
	  No Runtime
	  No GC ()
	- ![image.png](../assets/image_1750099370866_0.png){:height="700px" width="400px"}
	  https://discord.com/blog/why-discord-is-switching-from-go-to-rust
	- ownership & borrowing vs garbage collection
	- [RAII - Resource Acquisition is Initialization](https://doc.rust-lang.org/rust-by-example/scope/raii.html)
		- construction - memory-allocated (`malloc`)
		- destruction (goes out of scope) - release/`free`/de-allocate
	- [Most Admired 2024](https://survey.stackoverflow.co/2024/technology#admired-and-desired)
		- > "Rust continues to be the most-admired programming language with an 83% score this year."
		  > ~ Stackoverflow developer survey 2024
- Rust vs C/C++
	- Memory safety
- ecosystem & tooling
	- cargo
	- crates - vast, choose-your-own-adventure, mature, the usual maintenance/ownership challenges
	- clippy - linter `cargo clippy --fix`
	- `cargo format`
	- vscode, rustrover, windsurf, neovim, language-server
- Language features
	- `Some(foo)` / `None(foo)` / `Result(foo)`  -> `Err` (think this *or* that) sometimes called "union"
	- like OneOf or LanguageExt, but baked-in
	- `match`
	- linq-like chaining of list processing
	- Not quite Haskell-level functional (no higher-kinded types)
	- `macros!` (used everywhere)
	- waaaaaaaaay more
	- great intro docs
	- [many books](https://rustworkshop.co/2023/06/18/rust-programming-books/)
	- No surprise NULL values (use `Some(xxx)`)
- Culture
	- Friendly, welcoming, teaching
	- Performance for everything - no wasted CPU cycles ("zero cost abstractions") - pervades the crates
	- [Active community](https://rustworkshop.co/2023/04/27/how-to-be-part-of-the-rust-community/) - meetups, worldwide conferences
- Applications
	- web / microservice
	- backend (axum etc)
	- frontend (leptos etc)
	- WASM
	- WASI - serverless - fassssssssssssst startup time
	- embedded systems
		- cars
		- hearing aids
		- building management control
- Testing
	- tidy default unit test options
	- ```rust
	  #[test]
	  fn tags() {
	    // Arrange
	    let gitopolis = Gitopolis::new(storage, git);
	    // Act
	    let result = gitopolis.tags().expect("oh no!");
	    // Assert
	    assert_eq!(3, result.len());
	    assert_eq!("another_tag", result[0]);
	  }
	  ```
	- many crates for improved testing
	- strong support for profiling
- Error handling & propogation
	- explicit
	- panic or return Result
	- cleaner than GoLang
	- safer than exceptions
- Compilation
	- No IL
	- Longer compile, but shift-left on problems
- Learning rust
	- https://www.rust-lang.org/learn -> https://doc.rust-lang.org/book/
	-