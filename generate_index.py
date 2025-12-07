from pathlib import Path
from datetime import datetime

DOCS_DIR = Path("docs")

TITLE_MAP = {
    "world_map.html": " Global COVID-19 Cases Map",
    "positivity_rate_chart.html": " Positivity Rate by Country",
    "trend_weekly_growth.html": " Weekly Growth Rate Trend",
    "top10_countries_bar.html": " Top 10 Countries by Cases",
    "who_region_analysis.html": " WHO Regional Analysis",
}

DESCRIPTION_MAP = {
    "world_map.html": "Interactive choropleth map showing confirmed cases across the world.",
    "positivity_rate_chart.html": "Bar chart highlighting testing positivity rates across countries.",
    "trend_weekly_growth.html": "Time series of weekly growth rates to track pandemic dynamics.",
    "top10_countries_bar.html": "Ranked overview of countries with the highest number of confirmed cases.",
    "who_region_analysis.html": "Comparison of total cases and deaths across WHO regions.",
}

def prettify_filename(name: str) -> str:
    base = name.rsplit(".", 1)[0]
    base = base.replace("_", " ").replace("-", " ")
    return base.title()

def build_index_html():
    files = sorted(
        f for f in DOCS_DIR.glob("*.html")
        if f.name != "index.html"
    )

    cards_html = []
    for f in files:
        fname = f.name
        title = TITLE_MAP.get(fname, prettify_filename(fname))
        desc = DESCRIPTION_MAP.get(fname, f"Interactive report: {title}.")
        card = f"""
            <article class="card">
                <h2>{title}</h2>
                <p>{desc}</p>
                <a href="{fname}" class="btn">Open report</a>
            </article>
        """
        cards_html.append(card)

    generated_at = datetime.now().strftime("%Y-%m-%d %H:%M")

    html = f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>COVID-19 Interactive Reports</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        :root {{
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
            background-color: #0f172a;
            color: #e5e7eb;
        }}
        body {{
            margin: 0;
            padding: 0;
        }}
        header {{
            padding: 1.5rem 2rem;
            background: linear-gradient(90deg, #0f172a, #1f2937);
            border-bottom: 1px solid #1f2937;
        }}
        .title {{
            margin: 0;
            font-size: 1.8rem;
        }}
        .subtitle {{
            margin: 0.25rem 0 0;
            color: #9ca3af;
            font-size: 0.95rem;
        }}
        main {{
            max-width: 1100px;
            margin: 2rem auto;
            padding: 0 1rem 3rem;
        }}
        .grid {{
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-top: 1.5rem;
        }}
        .card {{
            background: #111827;
            border-radius: 0.75rem;
            padding: 1.25rem 1.5rem;
            border: 1px solid #1f2937;
            box-shadow: 0 10px 25px rgba(0,0,0,0.35);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }}
        .card h2 {{
            margin: 0 0 0.5rem;
            font-size: 1.2rem;
            color: #f9fafb;
        }}
        .card p {{
            margin: 0 0 1rem;
            color: #9ca3af;
            font-size: 0.9rem;
        }}
        .btn {{
            align-self: flex-start;
            text-decoration: none;
            padding: 0.5rem 0.9rem;
            border-radius: 999px;
            background: #2563eb;
            color: #f9fafb;
            font-size: 0.9rem;
            border: none;
            cursor: pointer;
            transition: background 0.18s ease, transform 0.1s ease;
        }}
        .btn:hover {{
            background: #1d4ed8;
            transform: translateY(-1px);
        }}
        footer {{
            text-align: center;
            padding: 1rem 0 1.5rem;
            color: #6b7280;
            font-size: 0.75rem;
            border-top: 1px solid #1f2937;
        }}
        .meta {{
            font-size: 0.8rem;
            color: #6b7280;
            margin-top: 0.5rem;
        }}
        @media (max-width: 600px) {{
            header {{
                padding: 1rem 1.25rem;
            }}
            .title {{
                font-size: 1.4rem;
            }}
        }}
    </style>
</head>
<body>
    <header>
        <h1 class="title">COVID-19 Interactive Reports</h1>
        <p class="subtitle">
            SQL + PostgreSQL + Python • Automatically generated analytical dashboards
        </p>
        <p class="meta">Index last generated: {generated_at}</p>
    </header>
    <main>
        <section class="grid">
            {''.join(cards_html)}
        </section>
    </main>
    <footer>
        Built from the analysis_COVID19 project · Generated automatically from HTML reports in the docs/ folder.
    </footer>
</body>
</html>
"""
    (DOCS_DIR / "index.html").write_text(html, encoding="utf-8")
    print("Generated docs/index.html")

if __name__ == "__main__":
    build_index_html()
