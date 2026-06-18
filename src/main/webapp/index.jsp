<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AuraMind - Mood & Personality Analysis</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
  html, body { font-family: 'Poppins', sans-serif; background: #f0ecff; width: 100%; height: 100%; overflow: hidden; }
  .page { display: flex; flex-direction: column; width: 100vw; height: 100vh; overflow: hidden; }

  .navbar {
    flex-shrink: 0; background: #fff;
    display: flex; align-items: center; justify-content: space-between;
    padding: 0 56px; height: 64px;
    box-shadow: 0 2px 10px rgba(108,99,255,.08); z-index: 100;
  }
  .logo { display: flex; align-items: center; gap: 9px; font-size: 22px; font-weight: 800; color: #6C63FF; text-decoration: none; }
  .logo svg { width: 36px; height: 36px; flex-shrink: 0; }
  .nav-links { display: flex; align-items: center; gap: 28px; }
  .nav-links a { text-decoration: none; color: #444; font-size: 14px; font-weight: 500; transition: color .2s; }
  .nav-links a.active { color: #6C63FF; border-bottom: 2px solid #6C63FF; padding-bottom: 2px; }
  .nav-links a:hover { color: #6C63FF; }
  .btn-nav { background: #6C63FF; color: #fff !important; padding: 9px 20px; border-radius: 10px; font-weight: 600; font-size: 14px; }
  .btn-nav:hover { background: #574bff; }

  .main { flex: 1; display: flex; flex-direction: column; overflow: hidden; padding: 0 40px; }

  .hero { flex: 0 0 auto; display: flex; align-items: center; justify-content: space-between; padding: 20px 16px 12px; gap: 24px; }
  .hero-text { flex: 1; max-width: 500px; }
  .hero-text h1 { font-size: 38px; font-weight: 800; line-height: 1.18; color: #1a1a2e; }
  .hero-text h1 .hl { color: #6C63FF; }
  .hero-text p { margin-top: 12px; font-size: 15px; color: #666; line-height: 1.65; max-width: 420px; }
  .hero-btns { display: flex; gap: 14px; margin-top: 22px; }
  .btn { display: inline-flex; align-items: center; padding: 11px 24px; border-radius: 11px; font-size: 15px; font-weight: 600; text-decoration: none; cursor: pointer; border: none; font-family: 'Poppins', sans-serif; transition: all .2s; }
  .btn-primary { background: #6C63FF; color: #fff; }
  .btn-primary:hover { background: #574bff; transform: translateY(-1px); }
  .btn-outline { background: transparent; color: #6C63FF; border: 2px solid #6C63FF; }
  .btn-outline:hover { background: #6C63FF; color: #fff; transform: translateY(-1px); }

  .hero-illus { flex-shrink: 0; width: 340px; display: flex; align-items: center; justify-content: center; }
  .illus-wrap { position: relative; width: 320px; height: 280px; }
  .bg-circle { position: absolute; bottom: 0; left: 50%; transform: translateX(-50%); width: 230px; height: 220px; background: #e2dcff; border-radius: 50%; }
  .mood-bubble { position: absolute; width: 44px; height: 44px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 20px; border: 3px solid #fff; box-shadow: 0 3px 10px rgba(0,0,0,.12); z-index: 3; }
  .b-happy   { top: 0;     left: 50%; transform: translateX(-50%); background: #FFD166; }
  .b-calm    { top: 58px;  left: 16px;  background: #9EE09E; }
  .b-blue    { top: 58px;  right: 16px; background: #87CEEB; }
  .b-sad     { top: 144px; left: 4px;   background: #FF9999; }
  .b-neutral { top: 144px; right: 4px;  background: #C9B8FF; }
  .connectors { position: absolute; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 1; }
  .figure-svg { position: absolute; bottom: 0; left: 50%; transform: translateX(-50%); z-index: 2; }

  .features { flex-shrink: 0; background: #fff; border-radius: 20px; padding: 20px 32px; box-shadow: 0 4px 20px rgba(108,99,255,.08); display: flex; justify-content: space-around; gap: 12px; }
  .feat-card { text-align: center; flex: 1; max-width: 150px; }
  .feat-icon { width: 48px; height: 48px; border-radius: 12px; margin: 0 auto 10px; display: flex; align-items: center; justify-content: center; font-size: 22px; }
  .ic-purple { background: #eeeaff; color: #6C63FF; }
  .ic-pink   { background: #ffe4ee; color: #e05297; }
  .ic-teal   { background: #ddf5f0; color: #12b886; }
  .ic-green  { background: #e4f8ea; color: #40c057; }
  .ic-yellow { background: #fff9db; color: #e67e00; }
  .feat-card h3 { font-size: 12px; font-weight: 700; color: #1a1a2e; margin-bottom: 4px; }
  .feat-card p  { font-size: 11px; color: #888; line-height: 1.5; }

  .quote { flex-shrink: 0; display: flex; align-items: center; gap: 16px; background: #edeaff; border-radius: 16px; margin-top: 12px; padding: 16px 32px; }
  .q-logo { flex-shrink: 0; width: 44px; height: 44px; border-radius: 50%; background: #d4ceff; display: flex; align-items: center; justify-content: center; }
  .q-body { flex: 1; }
  .q-body blockquote { font-size: 15px; font-weight: 600; color: #3d35a0; font-style: italic; line-height: 1.4; }
  .q-body cite { display: block; margin-top: 4px; font-size: 12px; color: #7c74c0; font-style: normal; }
  .q-leaf { flex-shrink: 0; opacity: .35; }
  footer { flex-shrink: 0; text-align: center; padding: 10px; color: #aaa; font-size: 12px; }
</style>
</head>
<body>
<div class="page">

  <nav class="navbar">
    <a href="index.jsp" class="logo">
      <!--
        LOGO: Single-color purple brain with white heart inside.
        Both lobes = same #7B5EC7. White wavy fold lines. White heart centered.
      -->
      <svg viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
        <!-- LEFT LOBE -->
        <path d="
          M20 33
          C 16 33, 10 31, 8 26
          C 6 21, 7 16, 10 13
          C 9 10, 10 7, 13 6.5
          C 14.5 4, 17 3.5, 19 4.5
          C 19.5 4, 20 3.8, 20 3.8
          L 20 33 Z"
          fill="#7B5EC7"/>
        <!-- RIGHT LOBE -->
        <path d="
          M20 33
          C 24 33, 30 31, 32 26
          C 34 21, 33 16, 30 13
          C 31 10, 30 7, 27 6.5
          C 25.5 4, 23 3.5, 21 4.5
          C 20.5 4, 20 3.8, 20 3.8
          L 20 33 Z"
          fill="#7B5EC7"/>
        <!-- Center groove -->
        <line x1="20" y1="5" x2="20" y2="33" stroke="#5a3fa8" stroke-width="0.8" opacity=".5"/>
        <!-- Left lobe fold lines -->
        <path d="M12 13 Q10 17 12 21" stroke="#fff" stroke-width="1.3" stroke-linecap="round" fill="none" opacity=".6"/>
        <path d="M15 7.5 Q12.5 11 15 15" stroke="#fff" stroke-width="1.3" stroke-linecap="round" fill="none" opacity=".6"/>
        <!-- Right lobe fold lines -->
        <path d="M28 13 Q30 17 28 21" stroke="#fff" stroke-width="1.3" stroke-linecap="round" fill="none" opacity=".6"/>
        <path d="M25 7.5 Q27.5 11 25 15" stroke="#fff" stroke-width="1.3" stroke-linecap="round" fill="none" opacity=".6"/>
        <!-- Bottom stem -->
        <path d="M17 33 Q18.5 36 20 35 Q21.5 36 23 33" stroke="#7B5EC7" stroke-width="1.5" stroke-linecap="round" fill="none"/>
        <!-- White heart -->
        <path d="
          M20 27
          C20 27, 15 23.5, 15 20.5
          C15 18.8, 16.3 17.5, 17.8 18
          C18.6 18.3, 19.4 19, 20 19.8
          C20.6 19, 21.4 18.3, 22.2 18
          C23.7 17.5, 25 18.8, 25 20.5
          C25 23.5, 20 27, 20 27Z"
          fill="#fff"/>
      </svg>
      AuraMind
    </a>
    <div class="nav-links">
      <a href="index.jsp" class="active">Home</a>
      <a href="login.jsp">Login</a>
      <a href="register.jsp" class="btn-nav">Get Started</a>
    </div>
  </nav>

  <div class="main">
    <section class="hero">
      <div class="hero-text">
        <h1>
          Understand Your <span class="hl">Mood.</span><br>
          Discover <span class="hl">Yourself.</span><br>
          Improve Your <span class="hl">Well-being.</span>
        </h1>
        <p>AuraMind helps you track daily moods, analyze patterns, discover your personality, and receive smart recommendations for a better emotional life.</p>
        <div class="hero-btns">
          <a href="register.jsp" class="btn btn-primary">Get Started</a>
          <a href="login.jsp"    class="btn btn-outline">Login</a>
        </div>
      </div>

      <div class="hero-illus">
        <div class="illus-wrap">
          

          <!-- Hero illustration image -->
          <img src="images/hero-image.png"
               alt="Meditating person with mood analysis"
               style="position:absolute;bottom:0;left:50%;transform:translateX(-50%);width:300px;height:280px;object-fit:contain;z-index:2;pointer-events:none;"/>


        </div>
      </div>
    </section>

    <!-- Features -->
    <div class="features">
      <div class="feat-card">
        <div class="feat-icon ic-purple"><i class="fa-regular fa-calendar-check"></i></div>
        <h3>Daily Mood Tracking</h3>
        <p>Log your daily mood in seconds and keep track of your emotions.</p>
      </div>
      <div class="feat-card">
        <div class="feat-icon ic-pink"><i class="fa-solid fa-chart-column"></i></div>
        <h3>Weekly Analysis</h3>
        <p>Visualize your mood patterns with easy weekly insights.</p>
      </div>
      <div class="feat-card">
        <div class="feat-icon ic-teal"><i class="fa-solid fa-calendar-days"></i></div>
        <h3>Monthly Calendar</h3>
        <p>View your entire month at a glance with our mood calendar.</p>
      </div>
      <div class="feat-card">
        <div class="feat-icon ic-green"><i class="fa-solid fa-brain"></i></div>
        <h3>Personality Test</h3>
        <p>Discover your personality type and understand yourself better.</p>
      </div>
      <div class="feat-card">
        <div class="feat-icon ic-yellow"><i class="fa-solid fa-lightbulb"></i></div>
        <h3>Smart Recommendations</h3>
        <p>Get AI-powered recommendations to improve your well-being.</p>
      </div>
    </div>

    <!-- Quote -->
    <div class="quote">
      <div class="q-logo">
        <svg width="28" height="28" viewBox="0 0 40 40" fill="none">
          <path d="M20 33 C16 33,10 31,8 26 C6 21,7 16,10 13 C9 10,10 7,13 6.5 C14.5 4,17 3.5,19 4.5 C19.5 4,20 3.8,20 3.8 L20 33Z" fill="#7B5EC7"/>
          <path d="M20 33 C24 33,30 31,32 26 C34 21,33 16,30 13 C31 10,30 7,27 6.5 C25.5 4,23 3.5,21 4.5 C20.5 4,20 3.8,20 3.8 L20 33Z" fill="#7B5EC7"/>
          <line x1="20" y1="5" x2="20" y2="33" stroke="#5a3fa8" stroke-width="0.8" opacity=".5"/>
          <path d="M12 13 Q10 17 12 21" stroke="#fff" stroke-width="1.3" stroke-linecap="round" fill="none" opacity=".6"/>
          <path d="M15 7.5 Q12.5 11 15 15" stroke="#fff" stroke-width="1.3" stroke-linecap="round" fill="none" opacity=".6"/>
          <path d="M28 13 Q30 17 28 21" stroke="#fff" stroke-width="1.3" stroke-linecap="round" fill="none" opacity=".6"/>
          <path d="M25 7.5 Q27.5 11 25 15" stroke="#fff" stroke-width="1.3" stroke-linecap="round" fill="none" opacity=".6"/>
          <path d="M20 27 C20 27,15 23.5,15 20.5 C15 18.8,16.3 17.5,17.8 18 C18.6 18.3,19.4 19,20 19.8 C20.6 19,21.4 18.3,22.2 18 C23.7 17.5,25 18.8,25 20.5 C25 23.5,20 27,20 27Z" fill="#fff"/>
        </svg>
      </div>
      <div class="q-body">
        <blockquote>"Self-awareness is the first step to a better tomorrow."</blockquote>
        <cite>– AuraMind &nbsp;·&nbsp; Track • Analyze • Improve</cite>
      </div>
      <svg class="q-leaf" width="70" height="70" viewBox="0 0 80 80" fill="none">
        <path d="M20 70 Q10 40 35 20 Q15 50 40 60" fill="#9b8ee0"/>
        <path d="M40 70 Q30 45 50 25 Q32 55 55 65" fill="#9b8ee0" opacity=".6"/>
        <path d="M55 72 Q48 52 62 36" stroke="#9b8ee0" stroke-width="2" fill="none" opacity=".5"/>
      </svg>
    </div>

    <footer>© 2026 AuraMind | Mood & Personality Analysis System</footer>
  </div>
</div>
</body>
</html>
