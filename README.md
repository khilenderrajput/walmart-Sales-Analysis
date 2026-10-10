# Walmart Sales Analysis (Python + MySQL)

Project showcase page. Source: `public/index.html` (single file, no dependencies).

## Deploy on Render (recommended: Static Site, free)

1. Push this folder to a GitHub repo (`index.html` must stay inside `public/`).
2. Render dashboard > **New +** > **Static Site** > pick the repo.
3. Set:
   - **Build Command:** `echo "static site"` (or leave empty)
   - **Publish Directory:** `public`
4. Click **Create Static Site**.

Or use the Blueprint: **New +** > **Blueprint** and select the repo (it reads `render.yaml`).

## Alternative: Web Service

- **Runtime:** Node
- **Build Command:** `npm install`
- **Start Command:** `npm start`

Health check path: `/healthz`

## Run locally

    npm start
    # open http://localhost:10000
