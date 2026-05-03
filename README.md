
---

````markdown
# 🔷 SystemVerilog Adder Verification Environment

A lightweight **UVM-like verification environment** for a **4-bit adder with valid handshake**, implemented using **object-oriented SystemVerilog** and **mailbox-based TLM communication** (no UVM framework).

This project demonstrates a modular, scalable verification architecture suitable for RTL testing and learning verification concepts.

---

## 📁 Project Structure

```bash
.
├── design.sv            # DUT: 4-bit adder with valid handshake
├── wrapper.sv           # DUT wrapper
├── my_interface.sv      # SystemVerilog interface
├── transaction.sv       # Transaction class (randomized stimulus)
├── generator.sv         # Stimulus generator
├── driver.sv            # Drives DUT inputs
├── monitor.sv           # Observes DUT outputs
├── scoreboard.sv        # Functional checker (reference model)
├── agent.sv             # Combines generator, driver, monitor
├── environment.sv       # Connects agents and scoreboard
├── test.sv              # Test configuration
├── testbench.sv         # Top-level verification environment
└── adder_tb_motbox.sv   # Legacy reference testbench
````

---

## ⚙️ DUT Specification

* **Inputs:**

  * `clk`
  * `reset`
  * `valid`
  * `a[3:0]`
  * `b[3:0]`

* **Output:**

  * `c[4:0] = a + b`

* **Behavior:**

  * When `valid = 1`, the adder computes the result on the next clock edge.

---

## 🧪 Verification Architecture

This environment follows a **modular agent-based architecture** inspired by UVM principles:

| Component   | Responsibility                      |
| ----------- | ----------------------------------- |
| Generator   | Creates randomized transactions     |
| Driver      | Drives inputs to DUT                |
| Monitor     | Captures DUT outputs                |
| Scoreboard  | Compares expected vs actual results |
| Agent       | Groups generator, driver, monitor   |
| Environment | Connects all components             |

### 🔗 Communication Flow

* Generator → Driver (`gen2driv`)
* Monitor → Scoreboard (`mon2scb`)

---

## 🚀 How to Run (Local Simulation)

### 1️⃣ Compile

```bash
vlog *.sv
```

### 2️⃣ Run Simulation

```bash
vsim -c work.testbench -do "run -all; quit"
```

### 3️⃣ View Waveform

```bash
gtkwave dump.vcd
```

---

## 🌐 Run on EDA Playground

You can run this project directly online without installing any tools.

### 🔗 Steps:

1. Open:
   [https://www.edaplayground.com/](https://www.edaplayground.com/)

2. Select:

   * **Language:** SystemVerilog
   * Choose any supported simulator (Questa / Aldec recommended)

3. Add files:

   * Paste each `.sv` file into separate tabs
   * Or use **“+ Add New File”**

4. Set:

   * Top module = `testbench`
   * Enable: ☑️ *Open EPWave after run*

5. Click:

```text
Run
```

---

### ⚡ Notes for EDA Playground

* Ensure there is a clear **top module (`testbench`)**
* Keep all class-based files included in the same project
* If errors appear, check file order (interfaces first, then classes, then TB)

---

## 📊 Sample Output

```text
[GEN] a = 3, b = 2
[DRV] driving inputs to DUT
[MON] observed c = 5
[SCB PASS] match confirmed

[GEN] a = 7, b = 8
[MON] observed c = 15
[SCB PASS]
```

---

## ✨ Features

* Randomized constrained stimulus generation
* Object-oriented SystemVerilog design
* Mailbox-based TLM communication
* Self-checking scoreboard
* Valid handshake support
* Reset-aware testing
* Clean modular architecture
* Waveform debugging support (GTKWave / EPWave)

---

## 🔧 Customization

### 🎯 Change number of test cases

```systemverilog
int count = 100;
```

### 🎯 Modify constraints

```systemverilog
constraint range_c {
  a inside {[0:15]};
  b inside {[0:15]};
}
```

### 🎯 Add directed test

```systemverilog
a = 4'd10;
b = 4'd5;
valid = 1;
```

---

## 🧠 Notes

* This is a **lightweight UVM-style environment**, not full UVM
* Built fully using SystemVerilog OOP concepts
* Uses mailboxes for inter-component communication
* Easily extendable to other RTL verification projects

---

## 🚀 Future Improvements

* Add functional coverage
* Add assertions (SVA)
* Extend to pipelined adder
* Convert into full UVM environment
* Add score reporting dashboard

---

## 📌 Author Notes

This project is designed for learning and demonstrating:

* Verification architecture design
* SystemVerilog OOP usage
* Modular testbench development
```
