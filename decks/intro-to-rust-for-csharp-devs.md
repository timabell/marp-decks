---
theme: gaia
paginate: true
marp: true
class:
    - lead
---

## A quick intro to Rust 🦀 for C# devs

Tim Abell
Contract C# Tech Lead
Host of [Reading Rust Meetup](https://rustworkshop.co/meetup/)
[0x5.uk](https://0x5.uk/)


```rust
// hello.rs
fn main() {
    println!("Hello dotnet oxford!");
}
```

[Dotnet Oxford Lightning talks 17 June 2025](https://www.meetup.com/dotnetoxford/events/307454172/)

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

### Similarities to C#

- Strong typed
- Compiled
- Type inference - `var`
- Memory safe
- `unsafe` escape hatch
- Cargo Crate == NuGet Package
- `async`
- Multi-paradigm, broad applicability

---

### Differences from C#

- No exceptions - `panic!` or `Result<>`
- No nulls - `Option<>`
- No IL, No GC, No Runtime
- Faster and less overhead

---

### Syntax Differences from C#

- linq-like chaining of list processing
- Return last expression
- macros - e.g. `println!("hello again")`

---

![height:450px](img/rust/discord-gc-spikes.png)

[discord.com/blog/why-discord-is-switching-from-go-to-rust](https://discord.com/blog/why-discord-is-switching-from-go-to-rust)

--- 

### Memory management

ownership & borrowing vs garbage collection

- Rust: [RAII - Resource Acquisition is Initialization](https://doc.rust-lang.org/rust-by-example/scope/raii.html)
	- construction - memory-allocated (`malloc`)
	- destruction (goes out of scope) - release/`free`/de-allocate

---

### Popular

![height:400px](img/rust/stackoverflow-survey-2024.png)

[Most Admired 2024](https://survey.stackoverflow.co/2024/technology#admired-and-desired)

<!--
> "Rust continues to be the most-admired programming language with an 83% score this year."
> ~ Stackoverflow developer survey 2024
-->

---

## Rust vs C/C++

- Memory safe by default
- Easier to learn
- Can be embedded in C programs

---

## Ecosystem & tooling

- cargo
- rustup / asdf-vm
- crates - vast, choose-your-own-adventure, mature, the usual maintenance/ownership challenges
- clippy - linter `cargo clippy --fix`
- `cargo format`
- VSCode, RustRover, Windsurf, NeoVim
- Language-server

---

## Language features

- `Some(foo)` / `None(foo)` / `Result(foo)`  -> `Err` (think this *or* that) sometimes called "union"
- like OneOf or LanguageExt, but baked-in
- `match`
- Not quite Haskell-level functional (no higher-kinded types)
- `macros!` (used everywhere)
- waaaaaaaaay more

---

## Culture & community

- Friendly, welcoming, teaching
- [Great intro docs](https://www.rust-lang.org/learn)
- [many books](https://rustworkshop.co/2023/06/18/rust-programming-books/)
- [Active community](https://rustworkshop.co/2023/04/27/how-to-be-part-of-the-rust-community/) - meetups, worldwide conferences

---

## Applications

- Web / microservice
- Backend (axum etc)
- Frontend (leptos etc)
- WASM / WASI - serverless - fast startup
- Mobile apps
- Embedded systems
- ...

---

## Testing

```rust
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

<!--
- tidy default unit test options
- many crates for improved testing
- strong support for profiling
-->>

---

## Error handling & propogation

- Explicit
- `panic!` or return `Result<>`
- Cleaner than GoLang
- More predictable than C# Exceptions
- Ergonomic

---

## Compilation

- No IL
- Longer compile, but shift-left on problems
- Static deploy-anywhere binaries
- glibc linking / musl

---

## A look at some code

https://github.com/rustworkshop/gitopolis

---

### Tim Abell

- Contract C# Tech Lead
- Host of [Reading Rust Meetup](https://rustworkshop.co/meetup/)
- [0x5.uk](https://0x5.uk/)

```rust
fn main() {
    println!("Thanks!");
}
```
