# Ruby-Army-Builder
A modular Ruby-based army builder for a tabletop wargame system. Supports hierarchical unit composition, special rules, upgrades, and outputs structured summaries based on input commands.

## Features

- **Army**, **Squad**, **Unit**, **Hero**, **Monster**, and **Upgrade** classes with clear inheritance
- Enhanced units can include special rules
- Squads can contain multiple units
- Units can have multiple upgrades
- Outputs a detailed trace of creation and composition steps
- Bash test runner included to validate outputs

---

## File Overview

| File              | Description                                 |
|-------------------|---------------------------------------------|
| `main.rb`         | Entry point; parses input and writes output |
| `Army.rb`         | Defines `Army` (inherits from `Squad`)      |
| `Squad.rb`        | A `Squad` that can contain multiple units   |
| `Hero.rb`         | A powerful `EnhancedUnit` with boosted stats|
| `Monster.rb`      | A monster unit with solid stats             |
| `Unit.rb`         | Base class for all units                    |
| `EnhancedUnit.rb` | Units that support special rules            |
| `Upgrade.rb`      | Upgrade object applied to units             |
| `GameElement.rb`  | Interface-like module for common methods    |
| `test.sh`         | Bash script to test output vs expected      |

---

## How to Run

```bash
ruby main.rb input-0.txt output.txt
```
Each line in input-0.txt should follow a command format to construct the army. Example files input-*.txt and output-*.txt are used for testing.

To run automated tests across multiple inputs:
```bash
chmod +x test.sh
./test.sh
```

## Input Format Example
```bash
ARMY: BloodHorde Alice Chaos
SQUAD: Skulls
HERO: Doomslayer 150
UNIT: Berserker 50
UPGRADE: RageAmulet 20
SPECIAL RULE: Frenzy
MONSTER: Hellbeast 200
```

## Output Example
```bash
Creating Army: BloodHorde, Alice, Chaos
	Player: Alice,  faction: Chaos, army: Skulls (0, , ) units:
Creating Squad: Skulls
	Skulls (0, , )
Adding Squad to Army
	Player: Alice,  faction: Chaos, army: Skulls (0, , ) units: ...
Creating Hero: Doomslayer, 150
	...
Summary of final units
Last army: ...
Last squad: ...
```

## 🧠 Concepts Demonstrated
- Object-Oriented Design with inheritance and polymorphism
- Composition and containment (units within squads, squads within armies)
- State management and upgrades
- CLI-driven input/output with structured text parsing
