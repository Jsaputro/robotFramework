## 🚀 Getting Started

### Prerequisites
- Python 3.8+  
- [Robot Framework](https://robotframework.org/)  
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)  
- Chrome and [ChromeDriver](https://chromedriver.chromium.org/) on your PATH

### How to run project
**Execute test from singel test file from terminal**

robot testCase/loginTest.robot

**Execute test scenario with multiple file from terminal**

robot testSuite/scenario1.robot


Install the Python dependencies:
```bash
pip install robotframework robotframework-seleniumlibrary

**Structur project**
├── pages/ # Page‑object Model
│ ├── LoginPage.robot
│ ├── InventoryPage.robot
│ ├── ProductPage.robot
│ ├── cartPage.robot
│ └── checkoutPage.robot
├── testCase/ # Individual test Case
│ ├── loginTest.robot
│ ├── inventoryTest.robot
│ ├── cartTest.robot
│ └── checkoutTest.robot
├── testSuite/ # Example Tes Scenario
│ └── scenario1.robot
├── variables/ # Data driven
│ ├── env.py
│ ├── login.py
│ ├── product.py
│ └── userCheckout.py
├──


