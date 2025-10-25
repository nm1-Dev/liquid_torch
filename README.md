<!-- Banner -->
<p align="center">
  <img src="https://cdn.discordapp.com/attachments/1426848169567719455/1429194332618887168/image.png?ex=68f54072&is=68f3eef2&hm=f8005aa13443309ee06ab3f3b3f661ab453c26f77305ee03ee6b829407c5a0ef&" alt="Liquid Torch Banner" width="720"/>
</p>

<h1 align="center">🔦 Liquid Torch | FiveM Script</h1>

<p align="center">
  <a href="https://docs.qbcore.org/"><img src="https://img.shields.io/badge/Framework-QBCore-blue?style=for-the-badge"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge"></a>
  <img src="https://img.shields.io/badge/Status-Stable-success?style=for-the-badge">
  <img src="https://img.shields.io/badge/Language-Lua-orange?style=for-the-badge">
</p>

<p align="center">
  Lightweight and optimized torch system for FiveM supporting <b>QBCore</b> and <b>ESX</b> frameworks.<br>
  Players can toggle a realistic handheld torch using a usable item — no commands required.
</p>

---

## ✨ Features

- ✅ Works with **QBCore** or **ESX**
- 🔥 Usable **torch item**
- 🎬 Realistic holding animation
- 🪶 Lightweight and optimized (0.00–0.01 ms)
- 🧩 Fully configurable prop model
- 🛠️ Plug-and-play setup

---

## ⚙️ Installation

### 1. Download or Clone
```bash
git clone https://github.com/nm1-Dev/liquid_torch.git
````

Place the folder inside your server’s `resources` directory:

```
resources/[standalone]/liquid_torch
```

### 2. Add to Server Config

```cfg
ensure liquid_torch
```

### 3. Add the Torch Item

#### 🧩 QBCore

Add this inside `qb-core/shared/items.lua`:

```lua
["torch"] = {
    name = "torch",
    label = "Torch",
    weight = 100,
    type = "item",
    image = "torch.png",
    unique = false,
    useable = true,
    shouldClose = true,
    description = "A handheld torch that lights the way."
},
```

#### 🧩 ESX

Add this to your database:

```sql
INSERT INTO items (name, label, weight, rare, can_remove)
VALUES ('torch', 'Torch', 1, 0, 1);
```

---

## 🔧 Configuration

Edit your `config.lua` file:

```lua
Config = {}

Config.Framework = "qb" -- or "esx"

Config.Torch = {
    Item = "torch",
    model = "bzzz_prop_torch_fire001", -- Replace with your prop model
}
```

---

## ⚙️ How It Works

1. Player uses the **torch item** in their inventory.
2. The script:

   * Plays a holding animation.
   * Spawns & attaches the torch prop to the player’s hand.
   * Removes it automatically when used again.
3. Fully handled client-side with optimized loops.

---

## 🧑‍💻 Credits

* **Script developed by:** [Liquid Developments](https://liquid-devs.com)
* **Created & maintained by:** Nmsh
* **Prop created by:** [bzzz.tebex.io](https://bzzz.tebex.io) ❤️
* **Discord:** [Join our community](https://discord.gg/xkZ7GR5ge6)

---

## 📜 License

Released **for free** under the [MIT License](https://opensource.org/licenses/MIT).
You may modify and redistribute freely with proper credit.

---

<p align="center">
  <sub>Made with ❤️ by <b>Liquid Developments</b> | for FiveM RP servers.</sub>

</p>


