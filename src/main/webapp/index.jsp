<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>TuneWave - Feel the Music</title>

    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/navbar.css">
    <link rel="stylesheet" href="assets/css/hero.css">
    <link rel="stylesheet" href="assets/css/trending.css">
    <link rel="stylesheet" href="assets/css/artists.css">
    <link rel="stylesheet" href="assets/css/features.css">

</head>

<body>

    <%@ include file="components/header.jsp" %>
    <%@ include file="components/hero.jsp" %>
    <%@ include file="components/trending.jsp" %>
    <%@ include file="components/artists.jsp" %>
    
    <!-- Why Choose TuneWave -->
	<section class="why-section py-5">
	    <div class="container">
	        <div class="text-center mb-5">
	            <span class="section-subtitle">WHY CHOOSE TUNEWAVE</span>
	            <h2 class="section-title mt-3">Music Designed For Everyone</h2>
	            <p class="section-desc">Experience premium quality streaming with modern technologyand beautifully curated playlists.</p>
	        </div>
	
	        <div class="row">
	            <div class="col-lg-3 col-md-6 mb-4">
	                <div class="feature-card text-center">
	                    <div class="feature-icon">
	                        <i class="fas fa-headphones"></i>
	                    </div>
	                    <h4>Hi-Fi Audio</h4>
	                    <p>Crystal clear music with immersive sound quality.</p>
	                </div>
	            </div>
	
	            <div class="col-lg-3 col-md-6 mb-4">
	                <div class="feature-card text-center">
	                    <div class="feature-icon">
	                        <i class="fas fa-mobile-alt"></i>
	                    </div>
	                    <h4>Listen Anywhere</h4>
	                    <p>Enjoy music on desktop, tablet and mobile devices.</p>
	                </div>
	            </div>
	
	            <div class="col-lg-3 col-md-6 mb-4">
	                <div class="feature-card text-center">
	                    <div class="feature-icon">
	                        <i class="fas fa-heart"></i>
	                    </div>
	                    <h4>Personalized</h4>
	                    <p>Smart recommendations based on your listening habits.</p>
	                </div>
	            </div>
	
	            <div class="col-lg-3 col-md-6 mb-4">
	                <div class="feature-card text-center">
	                    <div class="feature-icon">
	                        <i class="fas fa-bolt"></i>
	                    </div>
	                    <h4>Fast Streaming</h4>
	                    <p>Instant playback with optimized cloud performance.</p>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>