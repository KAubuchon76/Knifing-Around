# DoTextDecorationV3.1.PS1

# The text string to texturize - currently static.
$string = "The quick brown fox jumped over the lazy sleeping dog"

# Set the starting value for Theta.
$theta = 0            

# Set the starting value for Phi.
$phi = 0.0349065850399

# Set the amount to increase the Theta. 
$theta_delta = 0.0711

# Set the amount to increase the Phi.
$phi_delta = 0.07655

# Nullify any old HTML output.
$html_text = $Null

# Create an index variable corresponding to the length of the input string.
# I started the index at zero (because of the substring method), so needed to subtract from the total length of the string.
$stringIndex = 0..([int]$string.Length - 1)

# Create a foreach loop to loop through the string index.

foreach ($i in $stringIndex) {
    # Define the variable $c as the character with the corresponding substring index, with a length of one.
    $c = $string.substring($i, 1)

    # Calculate the Sin of the Theta.
    $sin_theta = [math]::sin($Theta)
    
    # Calculate the Sin of the Phi.
    $sin_phi = [math]::sin($phi)                          
    
    # Use the same formula that Rick used.
    $size = [math]::Floor(140 + (60 * $sin_theta + 60 * $sin_phi) / 2)
    
    # Combine the current character and html formatting to the $html_text string variable.
    $html_text += "<span style='font-size:" + $size + "%'>" + $c + "</span>";
    
    # Increase the Theta value by the Theta delta increment.
    $Theta += $theta_delta

    # Increase the Phi value by the Phi delta increment.
    $phi += $phi_delta
}

