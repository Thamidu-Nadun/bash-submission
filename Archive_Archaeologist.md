# Archive Archaeologist

Deep within the digital catacombs, layers upon layers of compressed history await discovery. An ancient archive, nested within another, which itself is nested within yet another—like Russian dolls of data, each layer concealing the secrets of the layer beneath. Your task is to excavate these nested archives. Within the src directory, you'll find a compressed archive that contains another archive, which contains yet another. Extract all layers recursively until you reach the treasure at the center—a single text file that must be placed in the out directory with its original name preserved. The archives may be in tar.gz format, and you must extract them all, layer by layer, until no more archives remain and only the final file is revealed.

# Constraints

The script must be purely written in bash within the execute.sh file
