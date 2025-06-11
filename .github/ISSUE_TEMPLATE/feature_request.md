---
name: Feature request
about: Suggest an idea for this project
title: ''
labels: ''
assignees: ''

---

# ASMS Feature Request

## Feature Summary
[A clear, one-line description. Ex: "Add a driver update checker to `health-check.bat`"]

---

## Category
- [ ] Maintenance  
- [ ] Optimization  
- [ ] Security  
- [ ] Administration  
- [ ] Backup  
- [ ] Interface  
- [ ] Other: _______

---

## Problem/Opportunity
[Why is this needed? Ex: "Users currently need third-party tools to check for outdated drivers, creating security risks."]

---

## Proposed Solution
### Technical Implementation
1. **Script Location**: `advanced-tools/driver-update.bat`  
2. **Dependencies**: `winget` or `pnputil.exe`  
3. **Sample Code**:  
   ```bat
   @echo off
   pnputil.exe /enum-drivers | findstr "Published Name"
   ```

### User Flow
1. Added to `menus/health-menu.bat` under "[3] Driver Tools"  
2. Output format:  
   ```
   [✓] Driver v5.1.2 (up to date)  
   [!] Driver v3.0.0 (update available)  
   ```

---

## Integration Points
- [ ] Requires changes to `animation-utils.bat` (new status icons)  
- [ ] Adds 1 new file to `advanced-tools/`  
- [ ] Modifies 2 menu files:  
  - `menus/main-menu.bat`  
  - `menus/health-menu.bat`

---

## Additional Context
- **Security Note**: Should verify driver signatures  
- **Edge Case**: Handle systems without internet  
- **Visual**: Use yellow [!] for outdated drivers  

---

## Priority
- [ ] Critical  
- [ ] High  
- [ ] Medium  
- [ ] Low  

---

### Key Adaptations for ASMS:
1. **Batch-Script Specific Fields**  
   - Explicitly calls out script locations (`advanced-tools/`, `menus/`)  
   - Lists native Windows tools as dependencies (`pnputil.exe`)

2. **Modular Design Support**  
   - Tracks impact across multiple files (menus, utils)  
   - Suggests where new icons/animations would live

3. **Windows Admin Focus**  
   - Includes security validation requirements  
   - Considers offline edge cases common in enterprise

4. **Visual Consistency**  
   - Recommends status icon conventions ([✓], [!])  
   - Aligns with existing color/animation systems

---

### Enhancement Options:
1. **For Complex Features**  
   Add a dependency checklist:
   ## Pre-Requisites
   - [ ] Winget installed  
   - [ ] PowerShell ExecutionPolicy set  
   - [ ] 50MB disk space for driver cache

2. **For UI Changes**  
   Include ASCII mockup:
   
   ## Proposed Interface
   ```
   ╔══════════════════════════════╗
   ║       DRIVER UPDATER         ║
   ╟──────────────────────────────╢
   ║ 1. Check all drivers         ║
   ║ 2. Update selected driver    ║
   ╚══════════════════════════════╝
   ```

3. **For Enterprise Features**  
   Add a GPO/Policies section:
   
   ## Enterprise Deployment
   - [ ] Supports silent mode (`/silent`)  
   - [ ] Generates WMI-compatible logs  
   - [ ] Respects Group Policy restrictions
