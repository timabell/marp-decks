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
who am i
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

<!--
my journey to rust
-->

---

### Popularity

![height:400px](img/rust/stackoverflow-survey-2024.png)

[Most Admired 2024](https://survey.stackoverflow.co/2024/technology#admired-and-desired)

<!--
> "Rust continues to be the most-admired programming language with an 83% score this year."
> ~ Stackoverflow developer survey 2024

I chose for cheap web-scale
-->

---

### Similarities to C#

---

- Compiled
- Strong typed
- Memory safe
- Multi-paradigm, broad applicability
- Cargo Crate == NuGet Package
- `unsafe` escape hatch
- Not quite Haskell-level functional (no higher-kinded types)

---

Type inference

`var` == `let`

```rust
let url = &repo.remotes["origin"].url; // url is a &String
```

---

LINQ-like chaining of list processing

```rust
repos
  .into_vec()
  .into_iter()
  .filter(|r| r.tags.contains(&tag.to_string()))
  .collect()
```

---

async

```rust
pub(crate) async fn trace_requests(req: Request<Body>, next: Next)
	-> Result<Response, StatusCode>
{
	...
	let response = next.run(req).await;
	...
}
```

Needs runtime, e.g. Tokio

---

### Differences from C#

---

![height:450px](img/rust/discord-gc-spikes.png)

[discord.com/blog/why-discord-is-switching-from-go-to-rust](https://discord.com/blog/why-discord-is-switching-from-go-to-rust)

---

- No IL, No GC, No Runtime
- Faster and less overhead
- No nulls - `Option<>`
- No exceptions - `panic!` or `Result<>`
- Immutable by default `mut`
- Borrowing & lifetimes (later slides)
- Return of last expression

---

Slightly different function signature

```rust
pub fn add(&mut self, repo_folder: String) -> Result<(), GitopolisError> {
```
---

Richer `enum` type

```rust
enum Commands {
	Add {
		repo_folders: Vec<String>,
	},
	List {
		tag: Option<String>,
		long: bool,
	},
}
```

---

Macros are everywhere

```rust
#[derive(Subcommand)]
enum Commands {
...
```

```rust
println!("🏢 {}> Repo folder missing, skipped.", &repo.path);
```

--- 

Matching, Option and Result

```rust
match &Args::parse_from(wild::args()).command {
	Some(Commands::Add { repo_folders }) => add(repo_folders.to_owned()),
	Some(Commands::Remove { repo_folders }) => {
		init_gitopolis().remove(repo_folders).expect("oops");
	}
	Some(Commands::List { tag: tag_name, long,
	}) => list(
		init_gitopolis().list(tag_name).expect("oops"), *long,
	),
	None => {
		panic!("oh bugger")
	}
}
```
<!--
- like OneOf or LanguageExt, but baked-in
-->

--- 

### Memory management

Ownership, borrowing & lifetimes vs. garbage collection

Rust: [RAII - Resource Acquisition is Initialization](https://doc.rust-lang.org/rust-by-example/scope/raii.html)

- construction - memory-allocated (`malloc`)
- destruction (goes out of scope) - release/`free`/de-allocate
- single owner of every resource - borrow with `&something`

```rust
fn print_refs<'a, 'b>(x: &'a i32, y: &'b i32) {
```

---

## Ecosystem & tooling

- cargo
- rustup / asdf-vm
- [crates.io](https://crates.io/) - like nuget.org
- clippy - linter `cargo clippy --fix`
- `cargo format`
- VSCode, RustRover, Windsurf, NeoVim
- Language-server

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

## Rust vs C/C++

- Memory safe by default (security!!)
- Easier to learn
- Can be embedded in C programs
- US Gov mandate
- Enterprise conversions happening now (Microsoft, Google Android, etc)

---

## Applications

- Web / microservice
- Backend (axum etc)
- Frontend (leptos etc)
- WASM / WASI - serverless - fast startup
- Mobile apps
- Embedded systems
- Crypto

---

## Culture & community

- Friendly, welcoming, teaching
- [Great intro docs](https://www.rust-lang.org/learn)
- [Many books](https://rustworkshop.co/2023/06/18/rust-programming-books/)
- [Active community](https://rustworkshop.co/2023/04/27/how-to-be-part-of-the-rust-community/) - meetups,
- Worldwide conferences
  - [Rust Nation](https://www.rustnationuk.com/) London, March/April
  - [RustForge](https://rustforgeconf.com/) New Zealand, August

---

## A look at some code

If there's time...

https://github.com/rustworkshop/gitopolis

<!--
Next slide!
-->

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

<!--
Q&A
-->
