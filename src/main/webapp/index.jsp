<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

```
<title>Tomcat Maven DevOps Demo</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, Helvetica, sans-serif;
    }

    body {
        min-height: 100vh;
        background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
        color: white;
    }

    /* Navbar */
    nav {
        height: 70px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 8%;
        background: rgba(0, 0, 0, 0.35);
        backdrop-filter: blur(10px);
    }

    .logo {
        font-size: 26px;
        font-weight: bold;
        color: #00eaff;
    }

    .nav-links {
        display: flex;
        gap: 30px;
    }

    .nav-links a {
        color: white;
        text-decoration: none;
        font-size: 16px;
        transition: 0.3s;
    }

    .nav-links a:hover {
        color: #00eaff;
    }

    /* Main Hero */
    .hero {
        min-height: calc(100vh - 70px);
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        padding: 40px 20px;
    }

    .container {
        width: 100%;
        max-width: 1100px;
    }

    .badge {
        display: inline-block;
        padding: 10px 22px;
        border-radius: 30px;
        background: rgba(0, 234, 255, 0.15);
        border: 1px solid #00eaff;
        color: #00eaff;
        font-weight: bold;
        margin-bottom: 25px;
    }

    h1 {
        font-size: 60px;
        margin-bottom: 20px;
        background: linear-gradient(90deg, #00eaff, #7cffcb, #ffffff);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .subtitle {
        font-size: 22px;
        color: #d7e8ed;
        margin-bottom: 15px;
    }

    .description {
        max-width: 750px;
        margin: auto;
        color: #b9cdd3;
        font-size: 17px;
        line-height: 1.7;
    }

    /* Buttons */
    .buttons {
        margin-top: 35px;
    }

    .btn {
        display: inline-block;
        padding: 15px 32px;
        margin: 8px;
        border-radius: 30px;
        text-decoration: none;
        font-weight: bold;
        transition: 0.3s;
    }

    .primary {
        background: linear-gradient(90deg, #00c6ff, #0072ff);
        color: white;
        box-shadow: 0 8px 25px rgba(0, 114, 255, 0.4);
    }

    .secondary {
        border: 2px solid #00eaff;
        color: #00eaff;
        background: transparent;
    }

    .btn:hover {
        transform: translateY(-4px);
        box-shadow: 0 12px 30px rgba(0, 234, 255, 0.3);
    }

    /* Cards */
    .cards {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
        margin-top: 55px;
    }

    .card {
        padding: 25px 15px;
        border-radius: 18px;
        background: rgba(255, 255, 255, 0.08);
        border: 1px solid rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(10px);
        transition: 0.3s;
    }

    .card:hover {
        transform: translateY(-8px);
        background: rgba(255, 255, 255, 0.13);
    }

    .icon {
        font-size: 40px;
        margin-bottom: 15px;
    }

    .card h3 {
        color: #00eaff;
        margin-bottom: 10px;
    }

    .card p {
        color: #c7d9de;
        font-size: 14px;
        line-height: 1.5;
    }

    /* Status */
    .status {
        margin-top: 40px;
        display: inline-flex;
        align-items: center;
        gap: 10px;
        padding: 12px 22px;
        border-radius: 30px;
        background: rgba(0, 255, 140, 0.12);
        border: 1px solid #00ff8c;
        color: #00ff8c;
        font-weight: bold;
    }

    .dot {
        width: 12px;
        height: 12px;
        background: #00ff8c;
        border-radius: 50%;
        box-shadow: 0 0 15px #00ff8c;
    }

    /* Footer */
    footer {
        margin-top: 50px;
        padding: 20px;
        text-align: center;
        color: #9fb5bc;
        font-size: 14px;
    }

    /* Responsive */
    @media (max-width: 900px) {
        h1 {
            font-size: 45px;
        }

        .cards {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    @media (max-width: 600px) {
        nav {
            padding: 0 5%;
        }

        .nav-links {
            display: none;
        }

        h1 {
            font-size: 36px;
        }

        .subtitle {
            font-size: 18px;
        }

        .cards {
            grid-template-columns: 1fr;
        }
    }
</style>
```

</head>

<body>

```
<!-- Navigation -->
<nav>
    <div class="logo">🚀 DevOps Demo</div>

    <div class="nav-links">
        <a href="#">Home</a>
        <a href="#technology">Technology</a>
        <a href="hello">Servlet</a>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero">

    <div class="container">

        <div class="badge">
            ⚡ Maven + Tomcat Deployment
        </div>

        <h1>Tomcat Maven DevOps Demo</h1>

        <p class="subtitle">
            Build • Test • Package • Deploy • Run
        </p>

        <p class="description">
            Welcome to the Tomcat Maven DevOps demonstration project.
            This application is built using Maven and deployed on Apache Tomcat.
            The project demonstrates a simple CI/CD application deployment workflow.
        </p>

        <!-- Buttons -->
        <div class="buttons">
            <a href="hello" class="btn primary">
                🚀 Open Servlet
            </a>

            <a href="#technology" class="btn secondary">
                ⚙️ View Technology
            </a>
        </div>

        <!-- Technology Cards -->
        <div class="cards" id="technology">

            <div class="card">
                <div class="icon">☕</div>
                <h3>Java</h3>
                <p>
                    Java-based enterprise application running on the Tomcat server.
                </p>
            </div>

            <div class="card">
                <div class="icon">📦</div>
                <h3>Maven</h3>
                <p>
                    Maven is used to build, package and manage project dependencies.
                </p>
            </div>

            <div class="card">
                <div class="icon">🐱</div>
                <h3>Tomcat</h3>
                <p>
                    Apache Tomcat hosts and serves the Java web application.
                </p>
            </div>

            <div class="card">
                <div class="icon">🔧</div>
                <h3>DevOps</h3>
                <p>
                    Build and deployment automation demonstrates a DevOps workflow.
                </p>
            </div>

        </div>

        <!-- Application Status -->
        <div class="status">
            <span class="dot"></span>
            Application is Running Successfully
        </div>

        <footer>
            © 2026 Tomcat Maven DevOps Demo | Built for CI/CD Practice
        </footer>

    </div>

</section>
```

</body>
</html>
