# How to Convert Your Local Repo into an Official Fork

To submit a Pull Request in the future, GitHub requires your repository to be officially linked to the original project. Since you previously pushed your code to a standalone remote, follow these steps to link everything correctly:

## 1. Create the Fork on GitHub
Go to the original [Ollama repository](https://github.com/ollama/ollama) on GitHub and click the **Fork** button in the top right corner to create `your-username/ollama`.

## 2. Update Your Local Remotes
Update your local `origin` remote to point to this new official fork:
```bash
git remote set-url origin git@github.com:your-username/ollama.git
```

## 3. Add the Original Upstream
Add the original Ollama repository as the `upstream` remote so you can track their official updates:
```bash
git remote add upstream https://github.com/ollama/ollama.git
```

## 4. Fetch and Push
Fetch all current data from the original repository:
```bash
git fetch upstream
```

Push your existing local code (which includes all your autocomplete modifications) to your new official fork:
```bash
git push -u origin main
```

---

## Keeping Your Fork Updated
Whenever you want to pull the latest changes from the original Ollama developers into your custom build in the future, just run:
```bash
git fetch upstream
git rebase upstream/main
```